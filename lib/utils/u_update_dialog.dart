import "package:u/utilities.dart";

enum UpdateType { none, optional, force }

class UUpdateResponse {
  final Os? android;
  final Os? ios;
  final Os? windows;
  final Os? macos;

  UUpdateResponse({
    this.android,
    this.ios,
    this.windows,
    this.macos,
  });

  factory UUpdateResponse.fromJson(String str) => UUpdateResponse.fromMap(json.decode(str));

  factory UUpdateResponse.fromMap(Map<String, dynamic> json) => UUpdateResponse(
        android: json["android"] == null ? null : Os.fromMap(json["android"]),
        ios: json["ios"] == null ? null : Os.fromMap(json["ios"]),
        windows: json["windows"] == null ? null : Os.fromMap(json["windows"]),
        macos: json["macos"] == null ? null : Os.fromMap(json["macos"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "android": android?.toMap(),
        "ios": ios?.toMap(),
        "windows": windows?.toMap(),
        "macos": macos?.toMap(),
      };

  String toJson() => json.encode(toMap());
}

class Os {
  final int? min;
  final String? current;
  final String? link1;
  final String? link2;
  final String? link1Title;
  final String? link2Title;

  Os({
    this.min,
    this.current,
    this.link1,
    this.link2,
    this.link1Title,
    this.link2Title,
  });

  factory Os.fromMap(Map<String, dynamic> json) => Os(
        min: json["min"],
        current: json["current"],
        link1: json["link1"],
        link2: json["link2"],
        link1Title: json["link1Title"],
        link2Title: json["link2Title"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "min": min,
        "current": current,
        "link1": link1,
        "link2": link2,
        "link1Title": link1Title,
        "link2Title": link2Title,
      };
}

class UpdateDialog {
  static const String _skipKey = "skip_update_version";

  static Future<void> checkAndShow(
    BuildContext context,
    UUpdateResponse serverData,
  ) async {
    final Os? info = _platformUpdate(serverData);
    if (info == null) return;

    final UpdateType type = await _checkUpdate(info);

    if (type == UpdateType.none) return;

    // ✅ Skip check is ONLY for optional update
    if (type == UpdateType.optional) {
      final String? skipped = ULocalStorage.getString(_skipKey);
      if (skipped == info.current) return;
    }

    // ✅ Show dialog
    await showDialog(
      barrierDismissible: type == UpdateType.optional,
      context: context,
      builder: (_) => _dialog(context, info, type),
    );
  }

  static Widget _dialog(BuildContext context, Os info, UpdateType type) => WillPopScope(
        onWillPop: () async => type == UpdateType.optional,
        child: AlertDialog(
          title: Text(type == UpdateType.force ? "Update Required" : "Update Available"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                type == UpdateType.force ? "You must update to continue using the app." : "A newer version of the app is available.",
              ),
              const SizedBox(height: 16),
              if (info.link1 != null && info.link1Title != null)
                FilledButton(
                  onPressed: () => launchUrl(Uri.parse(info.link1!), mode: LaunchMode.externalApplication),
                  child: Text(info.link1Title!),
                ),
              if (info.link2 != null && info.link2Title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: FilledButton(
                    onPressed: () => launchUrl(Uri.parse(info.link2!), mode: LaunchMode.externalApplication),
                    child: Text(info.link2Title!),
                  ),
                ),
            ],
          ),
          actions: <Widget>[
            if (type == UpdateType.optional)
              TextButton(
                onPressed: () {
                  if (info.current != null) {
                    ULocalStorage.set(_skipKey, info.current);
                  }
                  Navigator.pop(context);
                },
                child: const Text("Later"),
              ),
          ],
        ),
      );

  static Os? _platformUpdate(UUpdateResponse x) {
    if (Platform.isAndroid) return x.android;
    if (Platform.isIOS) return x.ios;
    if (Platform.isWindows) return x.windows;
    if (Platform.isMacOS) return x.macos;
    return null;
  }

  static Future<UpdateType> _checkUpdate(Os info) async {
    if (info.min == null || info.current == null) return UpdateType.none;

    final PackageInfo pkgInfo = await PackageInfo.fromPlatform();
    final int localCode = int.tryParse(pkgInfo.buildNumber) ?? 0;

    final int minCode = info.min!;
    final int currentCode = int.parse(info.current!.replaceAll(".", ""));

    if (localCode < minCode) return UpdateType.force;
    if (localCode < currentCode) return UpdateType.optional;
    return UpdateType.none;
  }
}
