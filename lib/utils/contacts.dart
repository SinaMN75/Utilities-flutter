/// iOS: info.plist
///    <key>NSContactsUsageDescription</key>
///    <string>Reason we need access to the contact list</string>
///
/// Android: Manifest
///     <uses-permission android:name="android.permission.READ_CONTACTS"/>
///     <uses-permission android:name="android.permission.WRITE_CONTACTS"/>

part of 'utils.dart';

Future<List<Contact>> readContacts() async {
  final bool hasPermission = await contact.FlutterContacts.requestPermission(readonly: true);
  if (hasPermission)
    return contact.FlutterContacts.getContacts(withAccounts: true, withGroups: true, withPhoto: true, withProperties: true, withThumbnail: true);
  else
    return <Contact>[];
}

Future<void> createContact({
  required final String firstName,
  required final String lastName,
  required final String number,
}) async {
  final bool hasPermission = await contact.FlutterContacts.requestPermission();
  if (hasPermission)
    await contact.FlutterContacts.insertContact(
      Contact(
        displayName: firstName + " " + lastName,
        phones: <contact.Phone>[contact.Phone(number)],
        name: contact.Name(
          first: firstName,
          last: lastName,
          nickname: firstName + " " + lastName,
        ),
      ),
    );
  return;
}
