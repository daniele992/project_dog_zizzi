import '../../../data/models/login_request_model.dart';
import '../../repositories/authentication/login_repository.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<String> call(LoginRequestModel request) async {
    return await repository.login(request);
  }
}