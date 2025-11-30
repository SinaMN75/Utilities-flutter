import "package:u/utilities.dart";

abstract class ULocalAuth {
  static final LocalAuthentication auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async => await auth.canCheckBiometrics || await auth.isDeviceSupported();

  static Future<List<BiometricType>> availableBiometrics() async => auth.getAvailableBiometrics();

  static Future<bool> authenticate({
    final String localizedReason = "",
    final bool sensitiveTransaction = true,
    final bool biometricOnly = false,
  }) async {
    final bool didAuthenticate = await auth.authenticate(
      localizedReason: localizedReason,
      biometricOnly: biometricOnly,
      sensitiveTransaction: sensitiveTransaction,
    );
    return didAuthenticate;
  }
}
