import "package:u/utilities.dart";

class UDatabaseUtils {
  static final Map<String, UDatabasePackage> _instances = <String, UDatabasePackage>{};

  /// Initialize a database instance
  static Future<UDatabasePackage> initialize({
    String namespace = "default",
    bool enableEncryption = false,
    String? encryptionKey,
    int maxCacheSize = 10000,
    bool enableWAL = true,
    int walFlushInterval = 10,
    String storagePathSuffix = "",
  }) async {
    final String instanceKey = "$namespace:$storagePathSuffix";
    if (!_instances.containsKey(instanceKey)) {
      final UDatabasePackage db = UDatabasePackage();
      await db.initialize(
        enableEncryption: enableEncryption,
        encryptionKey: encryptionKey,
        maxCacheSize: maxCacheSize,
        enableWAL: enableWAL,
        walFlushInterval: walFlushInterval,
        storagePathSuffix: storagePathSuffix,
      );
      db.switchNamespace(namespace);
      _instances[instanceKey] = db;
    }
    return _instances[instanceKey]!;
  }

  /// Quick set
  static Future<void> set(String key, dynamic value, {String namespace = "default", Duration? expiry}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    await db.set(key, value, expiry: expiry);
  }

  /// Quick get
  static dynamic get(String key, {String namespace = "default", dynamic defaultValue}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    return db.get(key, defaultValue: defaultValue);
  }

  /// Quick remove
  static Future<void> remove(String key, {String namespace = "default"}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    await db.remove(key);
  }

  /// Quick batch set
  static Future<void> setMany(Map<String, dynamic> keyValues, {String namespace = "default", Duration? expiry}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    await db.setMany(keyValues, expiry: expiry);
  }

  /// Quick batch get
  static Future<Map<String, dynamic>> getMany(Iterable<String> keys, {String namespace = "default"}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    return db.getMany(keys);
  }

  /// Quick clear
  static Future<void> clear({String namespace = "default"}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    await db.clear();
  }

  /// Get all keys
  static Future<Set<String>> getKeys({String namespace = "default"}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    return db.keys;
  }

  /// Backup database
  static Future<void> backup(String destinationPath, {String namespace = "default"}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    await db.backup(destinationPath);
  }

  /// Restore database
  static Future<void> restore(String sourcePath, {String namespace = "default"}) async {
    final UDatabasePackage db = await initialize(namespace: namespace);
    await db.restore(sourcePath);
  }
}

class UDatabasePackage {
  static final UDatabasePackage _instance = UDatabasePackage._internal();
  late String _storagePath;
  late String _walPath;
  final Map<String, dynamic> _memoryCache = <String, dynamic>{};
  final Map<String, DateTime> _expiryTimes = <String, DateTime>{};
  final Map<String, int> _accessCounts = <String, int>{};
  final Map<String, int> _lruAccess = <String, int>{};
  int _lruCounter = 0;
  bool _isInitialized = false;
  bool _autoPersist = true;
  int _persistInterval = 30; // seconds
  final Set<String> _dirtyKeys = <String>{};
  bool _encryptionEnabled = false;
  String? _encryptionKey;
  int _maxCacheSize = 10000;
  bool _walEnabled = true;
  final List<Map<String, dynamic>> _walBuffer = <Map<String, dynamic>>[];
  int _walFlushInterval = 10;
  int _walOperationCount = 0;
  final Logger _logger = Logger("UDatabase");
  final Set<String> _namespaces = <String>{"default"};
  String _currentNamespace = "default";

  factory UDatabasePackage() => _instance;

  UDatabasePackage._internal() {
    _setupLogging();
  }

  /// Initialize the database
  Future<void> initialize({
    bool enableEncryption = false,
    String? encryptionKey,
    int maxCacheSize = 10000,
    bool enableWAL = true,
    int walFlushInterval = 10,
    String storagePathSuffix = "",
  }) async {
    if (_isInitialized) return;

    final Directory directory = await getApplicationDocumentsDirectory();
    _storagePath = "${directory.path}/key_value_store$storagePathSuffix";
    _walPath = "$_storagePath/wal.log";

    await Directory(_storagePath).create(recursive: true);

    _encryptionEnabled = enableEncryption;
    _encryptionKey = encryptionKey;
    _maxCacheSize = maxCacheSize;
    _walEnabled = enableWAL;
    _walFlushInterval = walFlushInterval;

    if (_walEnabled) await _recoverFromWAL();
    await _loadAllKeysToMemory();

    _startAutoPersist();
    _startExpiryChecker();

    _isInitialized = true;
    _logger.info("Database initialized with storage path: $_storagePath");
  }

  /// Set a value
  Future<void> set(String key, dynamic value, {Duration? expiry, bool persist = true}) async {
    _validateKey(key);
    _validateValue(value);

    final String prefixedKey = _prefixKey(key);
    _memoryCache[prefixedKey] = value;
    _accessCounts[prefixedKey] = (_accessCounts[prefixedKey] ?? 0) + 1;
    _updateLRU(prefixedKey);

    if (expiry != null) {
      _expiryTimes[prefixedKey] = DateTime.now().add(expiry);
    }

    if (persist) {
      _dirtyKeys.add(prefixedKey);
      if (_walEnabled) {
        _walBuffer.add(<String, dynamic>{
          "operation": "set",
          "key": prefixedKey,
          "value": value,
          "expiry": _expiryTimes[prefixedKey]?.toIso8601String(),
        });
        _walOperationCount++;
        if (_walOperationCount >= _walFlushInterval) await _flushWAL();
      }
    }

    _evictIfNeeded();
  }

  /// Get a value
  dynamic get(String key, {dynamic defaultValue}) {
    _validateKey(key);
    final String prefixedKey = _prefixKey(key);

    if (_isExpired(prefixedKey)) {
      remove(key);
      return defaultValue;
    }

    final dynamic value = _memoryCache[prefixedKey] ?? defaultValue;
    if (value != null) {
      _accessCounts[prefixedKey] = (_accessCounts[prefixedKey] ?? 0) + 1;
      _updateLRU(prefixedKey);
    }
    return value;
  }

  /// Check if a key exists
  bool containsKey(String key) {
    _validateKey(key);
    final String prefixedKey = _prefixKey(key);
    if (_isExpired(prefixedKey)) {
      remove(key);
      return false;
    }
    return _memoryCache.containsKey(prefixedKey);
  }

  /// Remove a key
  Future<void> remove(String key) async {
    _validateKey(key);
    final String prefixedKey = _prefixKey(key);

    _memoryCache.remove(prefixedKey);
    _expiryTimes.remove(prefixedKey);
    _accessCounts.remove(prefixedKey);
    _lruAccess.remove(prefixedKey);
    _dirtyKeys.remove(prefixedKey);

    if (_walEnabled) {
      _walBuffer.add(<String, dynamic>{"operation": "remove", "key": prefixedKey});
      _walOperationCount++;
      if (_walOperationCount >= _walFlushInterval) await _flushWAL();
    }

    await _deleteKeyFile(prefixedKey);
  }

  /// Get all keys in current namespace
  Set<String> get keys {
    _removeExpiredKeys();
    return _memoryCache.keys.where((String k) => k.startsWith("$_currentNamespace:")).map((String k) => k.substring(_currentNamespace.length + 1)).toSet();
  }

  /// Clear all data
  Future<void> clear() async {
    _memoryCache.clear();
    _expiryTimes.clear();
    _accessCounts.clear();
    _lruAccess.clear();
    _dirtyKeys.clear();

    if (_walEnabled) {
      _walBuffer.add(<String, dynamic>{"operation": "clear"});
      await _flushWAL();
    }

    final Directory dir = Directory(_storagePath);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
      await dir.create();
    }
  }

  /// Get multiple values
  Map<String, dynamic> getMany(Iterable<String> keys) {
    final Map<String, dynamic> result = <String, dynamic>{};
    for (final String key in keys) {
      result[key] = get(key);
    }
    return result;
  }

  /// Set multiple values
  Future<void> setMany(Map<String, dynamic> keyValues, {Duration? expiry}) async {
    for (final MapEntry<String, dynamic> entry in keyValues.entries) {
      await set(entry.key, entry.value, expiry: expiry, persist: false);
    }
    if (_autoPersist) {
      _dirtyKeys.addAll(keyValues.keys.map(_prefixKey));
    } else {
      await _persistMany(keyValues.keys.map(_prefixKey));
    }
  }

  /// Remove multiple keys
  Future<void> removeMany(Iterable<String> keys) async {
    for (final String key in keys) {
      await remove(key);
    }
  }

  /// Get access count
  int getAccessCount(String key) => _accessCounts[_prefixKey(key)] ?? 0;

  /// Get expiry times
  Map<String, DateTime> getExpiryTimes() {
    _removeExpiredKeys();
    return Map<String, DateTime>.fromEntries(
      _expiryTimes.entries.map((MapEntry<String, DateTime> e) => MapEntry<String, DateTime>(e.key.substring(_currentNamespace.length + 1), e.value)),
    );
  }

  /// Get size of a key
  Future<int> getSize(String key) async {
    final File file = File("$_storagePath/${_hashKey(key)}.kv");
    return await file.exists() ? await file.length() : 0;
  }

  /// Get total storage size
  Future<int> getTotalSize() async {
    final Directory dir = Directory(_storagePath);
    if (!await dir.exists()) return 0;
    int totalSize = 0;
    await for (final FileSystemEntity entity in dir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith(".kv")) {
        totalSize += await entity.length();
      }
    }
    return totalSize;
  }

  /// Backup database
  Future<void> backup(String destinationPath) async {
    final Directory sourceDir = Directory(_storagePath);
    final Directory destDir = Directory(destinationPath);
    if (!await destDir.exists()) await destDir.create(recursive: true);

    await for (final FileSystemEntity entity in sourceDir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith(".kv")) {
        final File destFile = File("$destinationPath/${entity.uri.pathSegments.last}");
        await entity.copy(destFile.path);
      }
    }
    _logger.info("Backup completed to $destinationPath");
  }

  /// Restore from backup
  Future<void> restore(String sourcePath) async {
    final Directory sourceDir = Directory(sourcePath);
    if (!await sourceDir.exists()) throw Exception("Backup does not exist");
    await clear();
    await for (final FileSystemEntity entity in sourceDir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith(".kv")) {
        final File destFile = File("$_storagePath/${entity.uri.pathSegments.last}");
        await entity.copy(destFile.path);
      }
    }
    await _loadAllKeysToMemory();
    _logger.info("Restored from $sourcePath");
  }

  /// Enable/disable auto-persist
  void setAutoPersist(bool enabled, {int intervalSeconds = 30}) {
    _autoPersist = enabled;
    _persistInterval = intervalSeconds;
  }

  /// Manually persist
  Future<void> persist() async {
    await _persistMany(_dirtyKeys);
    _dirtyKeys.clear();
    if (_walEnabled) await _flushWAL();
  }

  /// Import from JSON
  Future<void> importFromJson(String jsonStr) async {
    final dynamic data = json.decode(jsonStr);
    await setMany(data);
    await persist();
  }

  /// Export to JSON
  String exportToJson() => json.encode(_memoryCache);

  /// Enable encryption
  void enableEncryption(String key) {
    _encryptionKey = key;
    _encryptionEnabled = true;
  }

  /// Disable encryption
  void disableEncryption() {
    _encryptionEnabled = false;
    _encryptionKey = null;
  }

  /// Switch namespace
  void switchNamespace(String namespace) {
    if (!_namespaces.contains(namespace)) {
      _namespaces.add(namespace);
      _logger.info("Namespace $namespace created");
    }
    _currentNamespace = namespace;
  }

  // Private methods

  void _setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord record) {
      debugPrint("${record.level.name}: ${record.time}: ${record.message}");
    });
  }

  String _prefixKey(String key) => "$_currentNamespace:$key";

  void _updateLRU(String key) {
    _lruAccess[key] = _lruCounter++;
  }

  void _evictIfNeeded() {
    while (_memoryCache.length > _maxCacheSize) {
      final String lruKey = _lruAccess.entries.reduce((MapEntry<String, int> a, MapEntry<String, int> b) => a.value < b.value ? a : b).key;
      _logger.info("Evicting key: $lruKey");
      remove(lruKey);
    }
  }

  Future<void> _recoverFromWAL() async {
    final File walFile = File(_walPath);
    if (!await walFile.exists()) return;
    final String content = await walFile.readAsString();
    final List<String> lines = content.split("\n");
    for (String line in lines) {
      if (line.isEmpty) continue;
      final dynamic data = json.decode(line);
      switch (data["operation"]) {
        case "set":
          _memoryCache[data["key"]] = data["value"];
          if (data["expiry"] != null) _expiryTimes[data["key"]] = DateTime.parse(data["expiry"]);
          break;
        case "remove":
          _memoryCache.remove(data["key"]);
          break;
        case "clear":
          _memoryCache.clear();
          break;
      }
    }
    await walFile.delete();
  }

  Future<void> _flushWAL() async {
    if (_walBuffer.isEmpty) return;
    final File walFile = File(_walPath);
    final IOSink sink = walFile.openWrite(mode: FileMode.append);
    for (Map<String, dynamic> op in _walBuffer) {
      sink.writeln(json.encode(op));
    }
    await sink.flush();
    await sink.close();
    _walBuffer.clear();
    _walOperationCount = 0;
  }

  void _startExpiryChecker() {}

  bool _isExpired(String key) {
    final DateTime? expiry = _expiryTimes[key];
    return expiry != null && DateTime.now().isAfter(expiry);
  }

  void _removeExpiredKeys() {
    final List<String> expired = _expiryTimes.entries.where((MapEntry<String, DateTime> e) => _isExpired(e.key)).map((MapEntry<String, DateTime> e) => e.key).toList();
    expired.forEach(remove);
  }

  String _hashKey(String key) => md5.convert(utf8.encode(key)).toString();

  Future<void> _loadAllKeysToMemory() async {
    final Directory dir = Directory(_storagePath);
    if (!await dir.exists()) return;
    await for (final FileSystemEntity entity in dir.list()) {
      if (entity is File && entity.path.endsWith(".kv")) {
        try {
          final String content = await entity.readAsString();
          final String decoded = _decryptData(content);
          final Map<String, dynamic> map = json.decode(decoded);

          final String key = map["key"] as String;
          _memoryCache[key] = map["value"];
          _accessCounts[key] = map["accessCount"] as int? ?? 0;
          if (map["expiry"] != null) _expiryTimes[key] = DateTime.parse(map["expiry"] as String);
          _updateLRU(key);
        } catch (e) {
          _logger.warning("Corrupted file: ${entity.path}, skipping");
        }
      }
    }
    _removeExpiredKeys();
  }

  Future<void> _persistKey(String key) async {
    if (!_memoryCache.containsKey(key)) return;

    final Map<String, dynamic> data = <String, dynamic>{
      "key": key,
      "value": _memoryCache[key],
      "expiry": _expiryTimes[key]?.toIso8601String(),
      "accessCount": _accessCounts[key] ?? 0,
    };

    final String jsonStr = json.encode(data);
    final String encoded = _encryptData(jsonStr);
    final File file = File("$_storagePath/${_hashKey(key)}.kv");
    await file.writeAsString(encoded);
  }

  Future<void> _persistMany(Iterable<String> keys) async {
    for (final String key in keys) {
      await _persistKey(key);
    }
  }

  Future<void> _deleteKeyFile(String key) async {
    final File file = File("$_storagePath/${_hashKey(key)}.kv");
    if (await file.exists()) await file.delete();
  }

  void _startAutoPersist() {
    Timer.periodic(Duration(seconds: _persistInterval), (Timer timer) {
      if (_autoPersist && _dirtyKeys.isNotEmpty) {
        persist();
      }
    });
  }

  String _encryptData(String data) {
    if (!_encryptionEnabled || _encryptionKey == null) return data;

    final Uint8List key = utf8.encode(_encryptionKey!);
    final Uint8List bytes = utf8.encode(data);
    final Hmac hmacSha256 = Hmac(sha256, key);
    final Digest digest = hmacSha256.convert(bytes);

    final String combined = json.encode(<String, String>{
      "data": data,
      "hmac": digest.toString(),
    });

    return base64.encode(utf8.encode(combined));
  }

  String _decryptData(String encodedData) {
    if (!_encryptionEnabled || _encryptionKey == null) return encodedData;

    try {
      final String decoded = utf8.decode(base64.decode(encodedData));
      final Map<String, dynamic> map = json.decode(decoded) as Map<String, dynamic>;
      final String originalData = map["data"] as String;
      final String storedHmac = map["hmac"] as String;

      final Uint8List key = utf8.encode(_encryptionKey!);
      final Uint8List bytes = utf8.encode(originalData);
      final Hmac hmacSha256 = Hmac(sha256, key);
      final String computedHmac = hmacSha256.convert(bytes).toString();

      if (computedHmac != storedHmac) {
        _logger.warning("HMAC verification failed: data integrity compromised");
        return encodedData;
      }

      return originalData;
    } catch (e) {
      _logger.warning("Decoding failed: $e");
      return encodedData;
    }
  }

  void _validateKey(String key) {
    if (key.isEmpty || key.contains(RegExp(r"[/\\..]"))) {
      throw Exception("Invalid key: $key");
    }
  }

  void _validateValue(dynamic value) {
    try {
      json.encode(value);
    } catch (e) {
      throw Exception("Unsupported value type: ${value.runtimeType}");
    }
  }
}
