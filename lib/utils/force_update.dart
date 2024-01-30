part of 'utils.dart';

void forceUpdateDialog({
  required final String androidMinimumVersion,
  required final String iOSMinimumVersion,
  required final String androidDownloadLink,
  required final String iosDownloadLink,
  required final VoidCallback onNoUpdateAvailable,
}) async {
  if (Platform.isAndroid) {
    if (double.parse(androidMinimumVersion) > double.parse(await appBuildNumber()))
      await dialog(
        AlertDialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          contentPadding: const EdgeInsets.only(top: 10),
          content: SizedBox(
            height: 200,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("آپدیت نرم افزار"),
              ],
            ).marginSymmetric(horizontal: 7),
          ),
        ),
      );
    else
      onNoUpdateAvailable();
  }
  if (Platform.isIOS) {
    if (double.parse(iOSMinimumVersion) > double.parse(await appBuildNumber()))
      await dialog(
        AlertDialog(
          title: const Text("آپدیت نرم افزار"),
          content: const Text("لطفا جهت استفاده از اپلیکیشن اپلیکیشن را آپدیت کنید."),
          actions: <Widget>[
            button(title: "دانلود", onTap: () => launchURL(iosDownloadLink)),
            const SizedBox(height: 8),
            button(title: "خروج", buttonType: ButtonType.text, onTap: () => exit(0)),
          ],
        ),
      );
  } else
    onNoUpdateAvailable();
}
