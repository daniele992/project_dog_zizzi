import '../../domain/repositories/login_repository.dart';
import '../datasource/remote/auth_api.dart';
import '../../domain/entities/login_request_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthApi api;

  LoginRepositoryImpl(this.api);

  @override
  Future<String> login(LoginRequestModel request) async {
    final response = await api.login(request);
    return response.token; // JWT dal backend
  }
}
