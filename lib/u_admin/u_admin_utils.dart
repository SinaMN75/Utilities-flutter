part of "u_admin.dart";

class UAdminUtils {
  static void signOut({required VoidCallback onFinish}) => UNavigator.confirm(
    title: "خروج از حساب کاربری",
    message: "آیا از خروج از حساب کاربری خود اطمینان دارید؟",
    onCancel: UNavigator.back,
    onConfirm: () {
      ULocalStorage.clear();
      onFinish();
    },
  );
}
