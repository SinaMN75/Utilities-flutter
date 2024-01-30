part of 'utils.dart';

void forceUpdateDialog({
  required final String androidMinimumVersion,
  required final String iOSMinimumVersion,
}) async {
  if (Platform.isAndroid) {
    if (double.parse(androidMinimumVersion) > double.parse(await appBuildNumber())) {
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (final BuildContext context) => AlertDialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          contentPadding: const EdgeInsets.only(top: 10),
          backgroundColor: context.theme.cardColor,
          content: SizedBox(
            height: 200,
            child: Column(
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
    }
  }
}
