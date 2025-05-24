import 'package:local_auth/local_auth.dart';
import 'pin_storage.dart';

class PinAuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> verifyPin(String enteredPin) async {
    final storedPin = await PinStorage.getPin();
    return storedPin == enteredPin;
  }

  Future<void> setPin(String pin) => PinStorage.savePin(pin);

  Future<void> resetPin() => PinStorage.clearPin();

  Future<bool> authenticateWithBiometrics() async {
    final canAuthenticate = await auth.canCheckBiometrics || await auth.isDeviceSupported();
    if (!canAuthenticate) return false;

    try {
      return await auth.authenticate(
        localizedReason: 'Authenticate to access your app',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (_) {
      return false;
    }
  }
}