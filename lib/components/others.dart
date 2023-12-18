part of 'components.dart';

Widget divider({double? width, double height = 0.6, Color color = Colors.grey, EdgeInsets? padding}) => Container(
      margin: padding,
      width: width != null ? width : screenWidth,
      height: height,
      color: color,
    );

Widget dashedDivider({double? height}) => Row(
      children: <Widget>[
        for (int i = 0; i < 40; i++)
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: Divider(thickness: 1, height: height)),
                Expanded(child: Container()),
              ],
            ),
          ),
      ],
    );

Widget centerProgress() => const Center(child: CircularProgressIndicator());

Widget centerProgressCupertino() => const Center(child: CupertinoActivityIndicator());

Widget directionality({required final bool rtl, required final Widget child}) => Directionality(
      textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
      child: child,
    );

Widget willPopScope({required final Widget child, required final int currentIndex,final  String? message, required final VoidCallback goTo0Index, final String? title}) {
  DateTime? currentBackPressTime;
  int _currentIndex = currentIndex;
  return StatefulBuilder(
    builder: (final BuildContext context, final Function setState) => WillPopScope(
      child: child,
      onWillPop: () {
        if (_currentIndex == 0) {
          final DateTime now = DateTime.now();
          if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
            snackbarRed(title: title ?? "خروج", subtitle: message ?? 'برای خروج دوباره دکمه بازگشت را فشار دهید');
            currentBackPressTime = now;
            return Future<bool>.value(false);
          }
          return Future<bool>.value(true);
        } else {
          _currentIndex = 0;
          goTo0Index();
          return Future<bool>.value(false);
        }
      },
    ),
  );
}
