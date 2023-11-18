/// iOS: info.plist
///    <key>NSContactsUsageDescription</key>
///    <string>Reason we need access to the contact list</string>
///
/// Android: Manifest
///     <uses-permission android:name="android.permission.READ_CONTACTS"/>
///     <uses-permission android:name="android.permission.WRITE_CONTACTS"/>

part of 'utils.dart';

Future<List<Contact>> readContacts() async {
  final bool hasPermission = await FlutterContacts.requestPermission(readonly: true);
  if (hasPermission)
    return FlutterContacts.getContacts(withAccounts: true, withGroups: true, withPhoto: true, withProperties: true, withThumbnail: true);
  else
    return <Contact>[];
}
