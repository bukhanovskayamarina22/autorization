import 'package:encrypt/encrypt.dart';

class Encryption {
  Encryption();

  var key = Key.fromUtf8('2Ot9ypdvzCUFBJ1SX0lK3BP1qJ1UShO-');
  var iv = IV.fromLength(16);
  var encrypter =  Encrypter(AES(Key.fromUtf8('2Ot9ypdvzCUFBJ1SX0lK3BP1qJ1UShO-')));

  String encrypt(String text) => encrypter.encrypt(text, iv: iv).base64;

  String decrypt(String text) => encrypter.decrypt64(text, iv: iv);
  
}



