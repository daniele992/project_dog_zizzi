import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

/*const _storage = FlutterSecureStorage();

class AuthService {
  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:5059/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];

      //Salva il token nello storage sicuro
      await _storage.write(key: 'jwt', value: token);
      print('Token salvato: $token');
      return true;
    } else {
      print('Login fallito: ${response.statusCode}');
      return false;
    }
  }

  // Metodo per leggere il token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'jwt');
  }

  // Metodo per logout
  static Future<void> logout() async {
    await _storage.delete(key: 'jwt');
  }
} */

class TokenStorage {
  final FlutterSecureStorage _storage;

  TokenStorage(this._storage);

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt', value: token);
  }

  Future<String?> getToken() async {
    return _storage.read(key: 'jwt');
  }

  Future<void> clear() async {
    await _storage.delete(key: 'jwt');
  }

}
