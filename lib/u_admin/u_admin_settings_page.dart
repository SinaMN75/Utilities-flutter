part of "u_admin.dart";

class UAdminSettingsPage extends StatelessWidget {
  const UAdminSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return UScaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Column(
        children: <Widget>[
          settingTile(
            icon: Icons.dark_mode_outlined,
            title: UApp.isDarkMode ? "Dark Theme" : "Light Theme",
            trailing: Switch(
              value: isDarkMode,
              onChanged: (_) {
                UApp.switchTheme();
                delay(100, () {});
              },
            ),
          ).pSymmetric(vertical: 12),
          settingTile(
            icon: Icons.language_outlined,
            title: "Language",
            trailing: DropdownButton<String>(
              value: "persian",
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(value: "fa", child: Text("Persian")),
                DropdownMenuItem<String>(value: "en", child: Text("English")),
              ],
              onChanged: (String? i) {
                UApp.updateLocale(Locale(i!));
                delay(100, () {});
              },
            ),
          ).pSymmetric(vertical: 12),
          settingTile(
            icon: Icons.person_outline,
            title: "Update Profile",
            onTap: () {},
          ).pSymmetric(vertical: 12),
          UButton(
            onTap: () => UAdminUtils.signOut(onFinish: () {}),
            title: "Logout",
          ),
        ],
      ),
    );
  }

  Widget settingTile({required IconData icon, required String title, Widget? trailing, VoidCallback? onTap}) => Card(
        elevation: 1,
        child: ListTile(leading: Icon(icon), title: Text(title), trailing: trailing, onTap: onTap, contentPadding: const EdgeInsets.symmetric(horizontal: 16), minLeadingWidth: 24),
      );
}
