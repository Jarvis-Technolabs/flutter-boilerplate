import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_clean_architecture/core/encryption/encryption_repo.dart';
import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';

class EncryptionRepoImpl extends EncryptionRepo {
  @override
  String encryptText(
    String text,
  ) {
    final iv = IV.fromUtf8(utf8.decode(FlavourConfig.instance!.AES_IV));
    final key = Key.fromUtf8(utf8.decode(FlavourConfig.instance!.AES_KEY));
    final encryptor = Encrypter(
      AES(
        key,
        mode: AESMode.cbc,
      ),
    );
    return encryptor.encrypt(text, iv: iv).base64;
  }

  @override
  String decryptText(
    String encryptedText,
  ) {
    final iv = IV.fromUtf8(utf8.decode(FlavourConfig.instance!.AES_IV));
    final key = Key.fromUtf8(utf8.decode(FlavourConfig.instance!.AES_KEY));
    final encryptor = Encrypter(
      AES(
        key,
        mode: AESMode.cbc,
      ),
    );

    return encryptor.decrypt64(encryptedText, iv: iv);
  }
}
