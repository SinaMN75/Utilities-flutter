part of 'components.dart';

Future<void> forceUpdateDialog({
  required final androidMinimumVersion,
  required final iosMinimumVersion,
  required final androidDownloadLink1,
  required final iosDownloadLink1,
}) async {
  String appVersion = await appBuildNumber();
  if (isAndroid && appVersion.toInt() >= androidMinimumVersion) return;
  if (isIos && appVersion.toInt() >= iosMinimumVersion) return;
  return dialogAlert(
    title: Text("نسخه جدید"),
    Column(
      children: <Widget>[
        Text("نسخه جدید"),
        if (isAndroid)
          image("packages/utilities/lib/assets/images/bazaar_farsi.png").onTap(
            () => launchURL(androidDownloadLink1),
          ),
        if (isIos)
          image("packages/utilities/lib/assets/images/bazaar_farsi.png").onTap(
            () => launchURL(iosDownloadLink1),
          ),
      ],
    ),
  );
}
