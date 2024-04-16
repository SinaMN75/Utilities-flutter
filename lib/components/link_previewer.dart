part of 'components.dart';

Widget linkPreviewer({required final String link}) => AnyLinkPreview(
      link: link,
      displayDirection: UIDirection.uiDirectionHorizontal,
      bodyMaxLines: 10,
      bodyStyle: const TextStyle(fontSize: 12),
      borderRadius: 12,
      urlLaunchMode: LaunchMode.externalApplication,
      boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 3)],
    );
