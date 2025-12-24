import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/login_request_model.dart';

class LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSource(this.client);

  Future<bool> login(LoginRequestModel request) async {
    final response = await client.post(
      Uri.parse('https://localhost:5059/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Credenziali non valide');
    }
  }
}