/// iOS: info.plist
///    <key>NSContactsUsageDescription</key>
///    <string>Reason we need access to the contact list</string>
///
/// Android: Manifest
///     <uses-permission android:name="android.permission.READ_CONTACTS"/>
///     <uses-permission android:name="android.permission.WRITE_CONTACTS"/>

part of 'utils.dart';

Future<List<Contact>> readContacts() async {
  if (await FlutterContacts.requestPermission()) {
    return await FlutterContacts.getContacts(
      withAccounts: true,
      withGroups: true,
      sorted: true,
      withPhoto: true,
      withProperties: true,
      withThumbnail: true,
      deduplicateProperties: true,
    );
  }
  return <Contact>[];
}
