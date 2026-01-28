import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JwtUtils {


  static const _storage = FlutterSecureStorage();

  static Future<String?> getUserName() async {

    final token = await _storage.read(key: 'jwt');

    if(token == null) return null;
    if(JwtDecoder.isExpired(token)) return null;

    final decoded = JwtDecoder.decode(token);
    final name = decoded['name'] as String?;
    final surname = decoded['surname'] as String?;


    if(name == null || surname == null) return null;
    return '$name $surname';
  }

  static Future<String?> getEmail() async {
    final  token = await _storage.read(key: 'jwt');

    if(token == null) return null;
    if(JwtDecoder.isExpired(token)) return null;

    final decoded = JwtDecoder.decode(token);
    return decoded['email'] as String?;
  }

  static Future<bool> isAdmin() async {
    //Legge il token dallo storage
    final token = await _storage.read(key: 'jwt');
    if(token == null) return false;

    //Decodifica il payload
    final decoded = JwtDecoder.decode(token);

    //Recupera la claim "admin" e converte in boolean
    return decoded['admin'] == "True";
  }

  static Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'jwt');
    if (token == null) return false;

    return !JwtDecoder.isExpired(token);
  }

  static Future<void> logout() async {
    await _storage.delete(key: 'jwt');
  }



}
