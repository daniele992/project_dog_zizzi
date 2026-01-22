import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/login_request_model.dart';
import '../../models/login_response_model.dart';

class AuthApi {
  final http.Client client;
  final String baseUrl;

  AuthApi({
    required this.client,
    required this.baseUrl,
  });

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await client.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Login failed');
    }
  }
}