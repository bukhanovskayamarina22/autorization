import 'package:autorization/src/encryption.dart';

import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  Encryption encryption = Encryption();

  group('encryption', () {
    test('encrypt returns string that is not equal to the given text', () {
      var text = 'a';

      var r = encryption.encrypt(text);

      expect(r, isNot(equals(text)));
    });

    test('encrypt returns encrypted string', () async {
      var iv = encryption.iv;
      var encrypter = encryption.encrypter;
      var text = 'a';

      var encrypt = await encrypter.encrypt(text, iv: iv).base64;

      var r = encryption.encrypt(text);

      expect(r, encrypt);
    });
  });

  group('decryption', () {
    test('decrypt returns string that equals to the encrypted text', () {
      var iv = encryption.iv;
      var encrypter = encryption.encrypter;
      var text = 'a';

      var encrypt = encrypter.encrypt(text, iv: iv).base64;
      var decrypt = encrypter.decrypt64(encrypt, iv: iv);

      expect(text, decrypt);
    });

    test('decrypt returns decrypted string', () async {
      var iv = encryption.iv;
      var encrypter = encryption.encrypter;
      var text = 'a';

      var encrypt = encrypter.encrypt(text, iv: iv).base64;
      var decrypt = encrypter.decrypt64(encrypt, iv: iv);

      var r = encryption.decrypt(encrypt);

      expect(r, decrypt);
    });
  });
}