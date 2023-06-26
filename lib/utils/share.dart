import 'package:share_plus/share_plus.dart';

void shareText(final String text, {final String? subject}) => Share.share(text, subject: subject);

void shareFile(final List<String> file, final String text) => Share.shareXFiles(file.map(XFile.new).toList());
