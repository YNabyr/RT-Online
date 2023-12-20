import 'dart:convert';

import 'package:fast_rsa/fast_rsa.dart';
import 'package:venturo_core/constants/signature_constants.dart';

/// Fungsi untuk mengubah [payload] ke bentuk signature
///
/// Jika berbentuk json, ubah [payload] dengan [jsonEncode]
Future<String> encryptPayload(String payload) async {
  var result = await RSA.encryptPKCS1v15(payload, SignatureConstant.publicKey);

  return result;
}

/// Fungsi untuk mengubah [payload] kembali ke bentuk data raw
///
/// [payload] dalam bentuk signature
Future<String> decryptPayload(String payload) async {
  var result = await RSA.decryptPKCS1v15(payload, SignatureConstant.privateKey);

  return result;
}
