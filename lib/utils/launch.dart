import 'package:u/utilities.dart';

abstract class ULaunch {
  static Future<void> launchURL(final String url, {final LaunchMode mode = LaunchMode.platformDefault}) async => launchUrl(
        Uri.parse(url),
        mode: mode,
        webOnlyWindowName: kIsWeb ? "_self" : null,
      );

  static void launchWhatsApp(final String number) async => await launchURL("https://api.whatsapp.com/send?phone=$number");

  static void launchMap(final double latitude, final double longitude) async => await launchURL(
        Uri(scheme: 'geo', queryParameters: <String, String>{'q': '$latitude,$longitude'}).toString(),
      );

  static void launchTelegram(final String id) async => await launchURL("https://t.me/$id");

  static void launchInstagram(final String username) async => await launchURL("https://instagram.com/$username");

  static void call(final String phone) async => await launchURL("tel:$phone");

  static void sms(final String phone, final String body) async => await launchURL("sms:$phone?body=$body");

  static void shareWithTelegram(final String param) async => await launchURL("tg://msg?text=$param");

  static void shareWithWhatsapp(final String param) async => await launchURL("whatsapp://send?text=$param");

  static void shareWithEmail(final String param) async => await launchURL("mailto:?body=$param");

  static void email(final String email, final String subject) => launchURL(Uri(
          scheme: 'mailto',
          path: email,
          query: <String, String>{'subject': subject}
              .entries
              .map(
                (final MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
              )
              .join('&'))
      .toString());

  static void shareText(final String text, {final String? subject}) => Share.share(text, subject: subject);

  static void shareFile(final List<String> file, final String text) => Share.shareXFiles(file.map(XFile.new).toList());

  static void shareWidget({
    required final Widget widget,
  }) async =>
      await ScreenshotController().capture().then((final Uint8List? image) async {
        final Directory directory = await getApplicationDocumentsDirectory();
        final File imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image!);
        shareFile(<String>[imagePath.path], "");
      });
}
