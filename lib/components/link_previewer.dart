part of 'components.dart';

class ULinkPreviewer extends StatelessWidget {
  const ULinkPreviewer({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) => AnyLinkPreview(
        link: link,
        displayDirection: UIDirection.uiDirectionHorizontal,
        bodyMaxLines: 10,
        titleStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        errorWidget: Text(
          link,
          style: TextStyle(
            fontSize: 12,
            color: getContext().isDarkMode ? Colors.white : Colors.black,
          ),
        ).onTap(() => launchURL(link)),
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
