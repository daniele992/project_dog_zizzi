import '../entities/login_request_model.dart';

abstract class LoginRepository {
  Future<String> login(LoginRequestModel request);
}



