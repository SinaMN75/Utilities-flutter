import "dart:typed_data";

import "package:encrypt/encrypt.dart";

abstract class UEncryption {
  static String encryptString({required String plainText, required String key, required String iv}) {
    try {
      if (key.length != 32) throw ArgumentError("Key must be 32 bytes for AES-256.");
      if (iv.length != 16) throw ArgumentError("IV must be 16 bytes for AES.");

      final Encrypter encrypter = Encrypter(AES(Key.fromUtf8(key)));
      final IV ivObject = IV.fromUtf8(iv);
      final Encrypted encrypted = encrypter.encrypt(plainText, iv: ivObject);
      return encrypted.base64;
    } catch (e) {
      throw Exception("Encryption failed: $e");
    }
  }

  static String decryptString({required String base64Encrypted, required String key, required String iv}) {
    try {
      if (key.length != 32) throw ArgumentError("Key must be 32 bytes for AES-256.");
      if (iv.length != 16) throw ArgumentError("IV must be 16 bytes for AES.");

      final Encrypter encrypter = Encrypter(AES(Key.fromUtf8(key)));
      final IV ivObject = IV.fromUtf8(iv);
      final Encrypted encrypted = Encrypted.fromBase64(base64Encrypted);
      return encrypter.decrypt(encrypted, iv: ivObject);
    } catch (e) {
      throw Exception("Decryption failed: $e");
    }
  }

  static String encryptUint8List({required Uint8List data, required String key, required String iv}) {
    try {
      if (key.length != 32) throw ArgumentError("Key must be 32 bytes for AES-256.");
      if (iv.length != 16) throw ArgumentError("IV must be 16 bytes for AES.");

      final Encrypter encrypter = Encrypter(AES(Key.fromUtf8(key)));
      final IV ivObject = IV.fromUtf8(iv);
      final Encrypted encrypted = encrypter.encryptBytes(data, iv: ivObject);
      return encrypted.base64;
    } catch (e) {
      throw Exception("Encryption failed: $e");
    }
  }

  static Uint8List decryptUint8List({required String base64Encrypted, required String key, required String iv}) {
    try {
      if (key.length != 32) throw ArgumentError("Key must be 32 bytes for AES-256.");
      if (iv.length != 16) throw ArgumentError("IV must be 16 bytes for AES.");

      final Encrypter encrypter = Encrypter(AES(Key.fromUtf8(key)));
      final IV ivObject = IV.fromUtf8(iv);
      final Encrypted encrypted = Encrypted.fromBase64(base64Encrypted);
      return Uint8List.fromList(encrypter.decryptBytes(encrypted, iv: ivObject));
    } catch (e) {
      throw Exception("Decryption failed: $e");
    }
  }
}
