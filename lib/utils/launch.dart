import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(final String url, {final LaunchMode mode = LaunchMode.platformDefault}) async => launchUrl(
      Uri.parse(url),
      mode: mode,
    );

void launchWhatsApp(final String number) async => await launchURL("https://api.whatsapp.com/send?phone=$number");

void launchTelegram(final String id) async => await launchURL("https://t.me/$id");

void launchInstagram(final String username) async => await launchURL("https://instagram.com/$username");

void call(final String phone) async => await launchURL("tel:$phone");

void sms(final String phone) async => await launchURL("sms:$phone");

void shareWithTelegram(final String param) async => await launchURL("tg://msg?text=$param");

void shareWithWhatsapp(final String param) async => await launchURL("whatsapp://send?text=$param");

void shareWithEmail(final String param) async => await launchURL("mailto:?body=$param");

void email(final String email, final String subject) {
  String? encodeQueryParameters(final Map<String, String> params) => params.entries
      .map(
        (final MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
      )
      .join('&');

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{'subject': subject}),
  );

  launchURL(emailLaunchUri.toString());
}
