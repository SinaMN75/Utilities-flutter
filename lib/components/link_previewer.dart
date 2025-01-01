import 'package:u/utilities.dart';

class ULinkPreviewer extends StatelessWidget {
  const ULinkPreviewer({required this.link, super.key});

  final String link;

  @override
  Widget build(final BuildContext context) => AnyLinkPreview(
        link: link,
        displayDirection: UIDirection.uiDirectionHorizontal,
        bodyMaxLines: 10,
        titleStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        errorWidget: Text(
          link,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(navigatorKey.currentContext!).colorScheme.brightness == Brightness.dark ? Colors.white : Colors.black,
          ),
        ).onTap(() => ULaunch.launchURL(link)),
        bodyStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        cache: const Duration(days: 7),
        borderRadius: 12,
        backgroundColor: Colors.white,
        urlLaunchMode: LaunchMode.externalApplication,
        boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 3)],
      );
}
