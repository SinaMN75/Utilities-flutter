part of 'components.dart';

Widget linkPreviewer({required final String link}) => AnyLinkPreview(
      link: link,
      displayDirection: UIDirection.uiDirectionHorizontal,
      bodyMaxLines: 10,
      titleStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
      errorWidget: Text(
        link,
        style: TextStyle(
          fontSize: 12,
          color: context.isDarkMode ? Colors.white : Colors.black,
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
