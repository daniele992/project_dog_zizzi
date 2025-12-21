import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_registration_model.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<bool> register(UserRegistrationModel user) async {
    final response = await client.post(
      Uri.parse('https://localhost:5001/api/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    return response.statusCode == 200;
  }
}
