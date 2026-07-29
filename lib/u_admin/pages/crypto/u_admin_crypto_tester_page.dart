import "package:encrypt/encrypt.dart" as enc;
import "package:u/utilities.dart";

// Local-only playground for admins to encrypt, decrypt, encode and hash arbitrary text.
// It never touches the network: every algorithm runs on-device via the `encrypt` and `crypto` packages.
class UAdminCryptoTesterPage extends StatefulWidget {
  const UAdminCryptoTesterPage({super.key});

  @override
  State<UAdminCryptoTesterPage> createState() => _UAdminCryptoTesterPageState();
}

class _UAdminCryptoTesterPageState extends State<UAdminCryptoTesterPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _ivController = TextEditingController();

  late List<_CryptoAlgo> _algos;
  int _selected = 0;

  enc.AESMode _aesMode = enc.AESMode.cbc;
  bool _padding = true;
  _ByteEncoding _keyEncoding = _ByteEncoding.utf8;
  _ByteEncoding _ivEncoding = _ByteEncoding.utf8;
  int _aesKeyBytes = 32;

  String? _output;
  String? _error;

  @override
  void initState() {
    super.initState();
    _algos = _buildAlgos();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _keyController.dispose();
    _ivController.dispose();
    super.dispose();
  }

  _CryptoAlgo get _algo => _algos[_selected];

  List<_CryptoAlgo> _buildAlgos() => <_CryptoAlgo>[
    _CryptoAlgo(id: "aes", label: "AES", category: _Category.symmetric, icon: Icons.lock_rounded, needsKey: true, needsIv: true, isAes: true),
    _CryptoAlgo(id: "salsa20", label: "Salsa20", category: _Category.symmetric, icon: Icons.lock_outline_rounded, needsKey: true, needsIv: true),
    _CryptoAlgo(id: "fernet", label: "Fernet", category: _Category.symmetric, icon: Icons.enhanced_encryption_rounded, needsKey: true),
    _CryptoAlgo(id: "base64", label: "Base64", category: _Category.encoding, icon: Icons.data_object_rounded),
    _CryptoAlgo(id: "base64url", label: "Base64 URL", category: _Category.encoding, icon: Icons.link_rounded),
    _CryptoAlgo(id: "hex", label: "Hex", category: _Category.encoding, icon: Icons.tag_rounded),
    _CryptoAlgo(id: "md5", label: "MD5", category: _Category.hash, icon: Icons.fingerprint_rounded),
    _CryptoAlgo(id: "sha1", label: "SHA-1", category: _Category.hash, icon: Icons.fingerprint_rounded),
    _CryptoAlgo(id: "sha224", label: "SHA-224", category: _Category.hash, icon: Icons.fingerprint_rounded),
    _CryptoAlgo(id: "sha256", label: "SHA-256", category: _Category.hash, icon: Icons.fingerprint_rounded),
    _CryptoAlgo(id: "sha384", label: "SHA-384", category: _Category.hash, icon: Icons.fingerprint_rounded),
    _CryptoAlgo(id: "sha512", label: "SHA-512", category: _Category.hash, icon: Icons.fingerprint_rounded),
    _CryptoAlgo(id: "hmac", label: "HMAC-SHA256", category: _Category.hash, icon: Icons.vpn_key_rounded, needsKey: true),
  ];

  // Turns a text field into a Key/IV byte source honouring the chosen interpretation (UTF-8 / Base64 / Hex).
  enc.Key _key(final String v) => switch (_keyEncoding) {
    _ByteEncoding.utf8 => enc.Key.fromUtf8(v),
    _ByteEncoding.base64 => enc.Key.fromBase64(v),
    _ByteEncoding.hex => enc.Key(Uint8List.fromList(_hexDecode(v))),
  };

  enc.IV _iv(final String v) => switch (_ivEncoding) {
    _ByteEncoding.utf8 => enc.IV.fromUtf8(v),
    _ByteEncoding.base64 => enc.IV.fromBase64(v),
    _ByteEncoding.hex => enc.IV(Uint8List.fromList(_hexDecode(v))),
  };

  enc.Encrypter _encrypter() {
    switch (_algo.id) {
      case "aes":
        return enc.Encrypter(enc.AES(_key(_keyController.text), mode: _aesMode, padding: _padding ? "PKCS7" : null));
      case "salsa20":
        return enc.Encrypter(enc.Salsa20(_key(_keyController.text)));
      case "fernet":
        return enc.Encrypter(enc.Fernet(_key(_keyController.text)));
      default:
        throw Exception("Unsupported cipher");
    }
  }

  List<int> _hashInput() => utf8.encode(_inputController.text);

  Digest _digest() => switch (_algo.id) {
    "md5" => md5.convert(_hashInput()),
    "sha1" => sha1.convert(_hashInput()),
    "sha224" => sha224.convert(_hashInput()),
    "sha256" => sha256.convert(_hashInput()),
    "sha384" => sha384.convert(_hashInput()),
    "sha512" => sha512.convert(_hashInput()),
    "hmac" => Hmac(sha256, utf8.encode(_keyController.text)).convert(_hashInput()),
    _ => throw Exception("Unsupported hash"),
  };

  String _hexEncode(final List<int> bytes) => bytes.map((final int b) => b.toRadixString(16).padLeft(2, "0")).join();

  List<int> _hexDecode(final String hex) {
    final String clean = hex.replaceAll(RegExp(r"\s"), "");
    if (clean.length.isOdd) throw const FormatException("Hex length must be even");
    return <int>[for (int i = 0; i < clean.length; i += 2) int.parse(clean.substring(i, i + 2), radix: 16)];
  }

  void _run(final bool forward) {
    setState(() {
      _output = null;
      _error = null;
    });
    try {
      final String text = _inputController.text;
      if (text.isEmpty) {
        setState(() => _error = U.s.inputTextRequired);
        return;
      }
      String result;
      switch (_algo.category) {
        case _Category.symmetric:
          {
            final enc.Encrypter encrypter = _encrypter();
            final enc.IV? iv = _algo.needsIv ? _iv(_ivController.text) : null;
            result = forward ? encrypter.encrypt(text, iv: iv).base64 : encrypter.decrypt(enc.Encrypted.fromBase64(text), iv: iv);
          }
        case _Category.encoding:
          result = _encode(text, forward);
        case _Category.hash:
          result = _digest().toString();
      }
      setState(() => _output = result);
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  String _encode(final String text, final bool forward) => switch (_algo.id) {
    "base64" => forward ? base64.encode(utf8.encode(text)) : utf8.decode(base64.decode(text)),
    "base64url" => forward ? base64Url.encode(utf8.encode(text)) : utf8.decode(base64Url.decode(text)),
    "hex" => forward ? _hexEncode(utf8.encode(text)) : utf8.decode(_hexDecode(text)),
    _ => throw Exception("Unsupported encoding"),
  };

  void _generateKey() {
    final int bytes = _algo.id == "aes" ? _aesKeyBytes : 32;
    setState(() {
      _keyEncoding = _ByteEncoding.base64;
      _keyController.text = enc.Key.fromSecureRandom(bytes).base64;
    });
  }

  void _generateIv() {
    final int bytes = _algo.id == "salsa20"
        ? 8
        : _aesMode == enc.AESMode.gcm
        ? 12
        : 16;
    setState(() {
      _ivEncoding = _ByteEncoding.base64;
      _ivController.text = enc.IV.fromSecureRandom(bytes).base64;
    });
  }

  void _copy(final String value) {
    UClipboard.set(value);
    UToast.snackBar(message: U.s.copiedToClipboard);
  }

  @override
  Widget build(final BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return UScaffold(
      padding: const EdgeInsets.all(20),
      body: SingleChildScrollView(
        child: UColumn(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(cs),
            _algoSelector(cs),
            _configCard(cs),
            _inputCard(cs),
            _actions(cs),
            if (_output != null || _error != null) _outputCard(cs),
          ],
        ),
      ),
    );
  }

  Widget _header(final ColorScheme cs) => URow(
    spacing: 14,
    children: <Widget>[
      Icon(Icons.security_rounded, size: 34, color: cs.primary).container(
        padding: const EdgeInsets.all(12),
        backgroundColor: cs.primary.withValues(alpha: 0.12),
        radius: 16,
      ),
      UColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextHeadlineSmall(U.s.cryptoTester, fontWeight: FontWeight.bold),
          UTextBodySmall(U.s.cryptoTesterSubtitle, color: cs.onSurface.withValues(alpha: 0.6)),
        ],
      ).expanded(),
    ],
  );

  Widget _algoSelector(final ColorScheme cs) => Wrap(
    spacing: 10,
    runSpacing: 10,
    children: List<Widget>.generate(_algos.length, (final int i) {
      final bool active = i == _selected;
      final _CryptoAlgo a = _algos[i];
      return URow(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: <Widget>[
              Icon(a.icon, size: 16, color: active ? cs.onPrimary : cs.primary),
              UTextLabelLarge(a.label, color: active ? cs.onPrimary : cs.onSurface, fontWeight: FontWeight.w600),
            ],
          )
          .pSymmetric(horizontal: 14, vertical: 10)
          .container(
            backgroundColor: active ? cs.primary : cs.surfaceContainerHighest.withValues(alpha: 0.5),
            radius: 12,
            borderColor: active ? cs.primary : cs.outlineVariant,
          )
          .onTap(
            () => setState(() {
              _selected = i;
              _output = null;
              _error = null;
            }),
          );
    }),
  );

  Widget _configCard(final ColorScheme cs) {
    final List<Widget> rows = <Widget>[];
    if (_algo.isAes) rows.add(_aesConfig(cs));
    if (_algo.needsKey) rows.add(_keyField(cs));
    if (_algo.needsIv) rows.add(_ivField(cs));
    if (rows.isEmpty) return const SizedBox.shrink();
    return UCard(
      child: UColumn(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          URow(
            spacing: 10,
            children: <Widget>[
              Icon(Icons.tune_rounded, color: cs.primary),
              UTextTitleMedium(U.s.configuration, fontWeight: FontWeight.bold),
            ],
          ),
          const Divider(height: 1),
          ...rows,
        ],
      ).pAll(20),
    );
  }

  Widget _aesConfig(final ColorScheme cs) => Wrap(
    spacing: 16,
    runSpacing: 14,
    children: <Widget>[
      SizedBox(
        width: 180,
        child: UDropDownField<enc.AESMode>(
          initialValue: _aesMode,
          labelText: U.s.mode,
          items: enc.AESMode.values.map((final enc.AESMode m) => DropdownMenuItem<enc.AESMode>(value: m, child: UTextBodyMedium(_aesModeLabel(m)))).toList(),
          onChanged: (final enc.AESMode? m) => setState(() => _aesMode = m ?? enc.AESMode.cbc),
        ),
      ),
      SizedBox(
        width: 150,
        child: UDropDownField<bool>(
          initialValue: _padding,
          labelText: U.s.padding,
          items: <DropdownMenuItem<bool>>[
            const DropdownMenuItem<bool>(value: true, child: UTextBodyMedium("PKCS7")),
            DropdownMenuItem<bool>(value: false, child: UTextBodyMedium(U.s.none)),
          ],
          onChanged: (final bool? p) => setState(() => _padding = p ?? true),
        ),
      ),
      SizedBox(
        width: 150,
        child: UDropDownField<int>(
          initialValue: _aesKeyBytes,
          labelText: U.s.keySize,
          items: const <DropdownMenuItem<int>>[
            DropdownMenuItem<int>(value: 16, child: UTextBodyMedium("128-bit")),
            DropdownMenuItem<int>(value: 24, child: UTextBodyMedium("192-bit")),
            DropdownMenuItem<int>(value: 32, child: UTextBodyMedium("256-bit")),
          ],
          onChanged: (final int? b) => setState(() => _aesKeyBytes = b ?? 32),
        ),
      ),
    ],
  );

  Widget _keyField(final ColorScheme cs) => URow(
    spacing: 10,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      UTextField(controller: _keyController, labelText: U.s.secretKey, hintText: U.s.secretKey).expanded(),
      if (_algo.id != "hmac") ...<Widget>[
        SizedBox(width: 130, child: _encodingDropdown(_keyEncoding, (final _ByteEncoding e) => setState(() => _keyEncoding = e), U.s.keyEncoding)),
        IconButton(
          tooltip: U.s.generate,
          onPressed: _generateKey,
          icon: Icon(Icons.casino_rounded, color: cs.primary),
        ),
      ],
    ],
  );

  Widget _ivField(final ColorScheme cs) => URow(
    spacing: 10,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      UTextField(controller: _ivController, labelText: U.s.initializationVector, hintText: U.s.initializationVector).expanded(),
      SizedBox(width: 130, child: _encodingDropdown(_ivEncoding, (final _ByteEncoding e) => setState(() => _ivEncoding = e), U.s.ivEncoding)),
      IconButton(
        tooltip: U.s.generate,
        onPressed: _generateIv,
        icon: Icon(Icons.casino_rounded, color: cs.primary),
      ),
    ],
  );

  Widget _encodingDropdown(final _ByteEncoding value, final ValueChanged<_ByteEncoding> onChanged, final String label) => UDropDownField<_ByteEncoding>(
    initialValue: value,
    labelText: label,
    items: const <DropdownMenuItem<_ByteEncoding>>[
      DropdownMenuItem<_ByteEncoding>(value: _ByteEncoding.utf8, child: UTextBodyMedium("UTF-8")),
      DropdownMenuItem<_ByteEncoding>(value: _ByteEncoding.base64, child: UTextBodyMedium("Base64")),
      DropdownMenuItem<_ByteEncoding>(value: _ByteEncoding.hex, child: UTextBodyMedium("Hex")),
    ],
    onChanged: (final _ByteEncoding? e) => onChanged(e ?? _ByteEncoding.utf8),
  );

  Widget _inputCard(final ColorScheme cs) => UCard(
    child: UColumn(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        URow(
          spacing: 10,
          children: <Widget>[
            Icon(Icons.edit_note_rounded, color: cs.primary),
            UTextTitleMedium(U.s.inputText, fontWeight: FontWeight.bold),
            const Spacer(),
            if (_output != null)
              TextButton.icon(
                onPressed: () => setState(() {
                  _inputController.text = _output ?? "";
                  _output = null;
                  _error = null;
                }),
                icon: const Icon(Icons.swap_vert_rounded, size: 18),
                label: UTextLabelMedium(U.s.useOutputAsInput),
              ),
          ],
        ),
        UTextField(controller: _inputController, hintText: U.s.inputText, lines: 4),
      ],
    ).pAll(20),
  );

  Widget _actions(final ColorScheme cs) {
    if (_algo.category == _Category.hash) {
      return UButton(
        title: U.s.hash,
        icon: const Icon(Icons.fingerprint_rounded),
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        onTap: () => _run(true),
      );
    }
    final bool encoding = _algo.category == _Category.encoding;
    return URow(
      spacing: 12,
      children: <Widget>[
        UButton(
          title: encoding ? U.s.encode : U.s.encrypt,
          icon: Icon(encoding ? Icons.arrow_downward_rounded : Icons.lock_rounded),
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          onTap: () => _run(true),
        ).expanded(),
        UButton(
          title: encoding ? U.s.decode : U.s.decrypt,
          icon: Icon(encoding ? Icons.arrow_upward_rounded : Icons.lock_open_rounded),
          backgroundColor: cs.surfaceContainerHighest,
          foregroundColor: cs.onSurface,
          onTap: () => _run(false),
        ).expanded(),
      ],
    );
  }

  Widget _outputCard(final ColorScheme cs) {
    final bool isError = _error != null;
    final Color accent = isError ? cs.error : UAdminTheme.green;
    return UCard(
      child: UColumn(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          URow(
            spacing: 10,
            children: <Widget>[
              UTextTitleMedium(isError ? U.s.error : U.s.output, fontWeight: FontWeight.bold, color: accent),
              const Spacer(),
              if (!isError)
                IconButton(
                  tooltip: U.s.copyToClipboard,
                  visualDensity: VisualDensity.compact,
                  icon: Icon(Icons.copy_rounded, size: 18, color: cs.primary),
                  onPressed: () => _copy(_output ?? ""),
                ),
            ],
          ),
          UContainer(
            padding: const EdgeInsets.all(14),
            color: (isError ? cs.error : cs.surfaceContainerHighest).withValues(alpha: isError ? 0.08 : 0.5),
            radius: 8,
            child: SelectableText(
              isError ? _error! : (_output ?? ""),
              style: TextStyle(fontFamily: "monospace", fontSize: 13, height: 1.5, color: isError ? cs.error : cs.onSurface),
            ).ltr(),
          ),
        ],
      ).pAll(20),
    );
  }

  String _aesModeLabel(final enc.AESMode mode) => switch (mode) {
    enc.AESMode.cbc => "CBC",
    enc.AESMode.cfb64 => "CFB-64",
    enc.AESMode.ctr => "CTR",
    enc.AESMode.ecb => "ECB",
    enc.AESMode.ofb64 => "OFB-64",
    enc.AESMode.ofb64Gctr => "OFB-64/GCTR",
    enc.AESMode.sic => "SIC",
    enc.AESMode.gcm => "GCM",
  };
}

enum _Category { symmetric, encoding, hash }

enum _ByteEncoding { utf8, base64, hex }

// Static description of one algorithm the tester exposes and which inputs it needs.
class _CryptoAlgo {
  _CryptoAlgo({
    required this.id,
    required this.label,
    required this.category,
    required this.icon,
    this.needsKey = false,
    this.needsIv = false,
    this.isAes = false,
  });

  final String id;
  final String label;
  final _Category category;
  final IconData icon;
  final bool needsKey;
  final bool needsIv;
  final bool isAes;
}
