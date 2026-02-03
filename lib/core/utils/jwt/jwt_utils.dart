import 'package:jwt_decoder/jwt_decoder.dart';

class JwtUtils {

 // static const _storage = FlutterSecureStorage();

  static String? getUserNameFromToken(String token) {
    if(JwtDecoder.isExpired(token)) return null;
    final decoded = JwtDecoder.decode(token);

    final name = decoded['name'] as String?;
    final surname = decoded['surname'] as String?;

    if(name == null || surname == null) return null;

    return '$name $surname';
  }

 /* static Future<String?> getEmail() async {
    final  token = await _storage.read(key: 'jwt');

    if(token == null) return null;
    if(JwtDecoder.isExpired(token)) return null;

    final decoded = JwtDecoder.decode(token);
    return decoded['email'] as String?;
  } */

 static bool isAdminFromToken(String token) {
    if(JwtDecoder.isExpired(token)) return false;
    final decoded = JwtDecoder.decode(token);
    final adminValue = decoded['admin'];
    if(adminValue == null) return false;
    if(adminValue is bool) return adminValue;

    //se arriva String "True/False"
    if(adminValue is String) return adminValue.toLowerCase() == 'true';

    //fallback
    return false;

 }

  /* static Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'jwt');
    if (token == null) return false;

    return !JwtDecoder.isExpired(token);
  } */

 /* static Future<void> logout() async {
    await _storage.delete(key: 'jwt');
  } */



}
