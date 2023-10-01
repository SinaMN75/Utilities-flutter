part of 'utils.dart';

final LocalAuthentication auth = LocalAuthentication();

Future<bool> canAuthenticate() async => await auth.canCheckBiometrics || await auth.isDeviceSupported();

Future<bool> authenticate({
  final String localizedReason = "",
  final bool useErrorDialogs = true,
  final bool stickyAuth = false,
  final bool sensitiveTransaction = true,
  final bool biometricOnly = false,
}) async {
  final bool didAuthenticate = await auth.authenticate(
    localizedReason: localizedReason,
    options: AuthenticationOptions(
      biometricOnly: biometricOnly,
      sensitiveTransaction: sensitiveTransaction,
      stickyAuth: stickyAuth,
      useErrorDialogs: useErrorDialogs,
    ),
  );
  return didAuthenticate;
}
