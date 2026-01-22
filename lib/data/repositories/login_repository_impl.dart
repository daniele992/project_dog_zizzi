import '../../domain/repositories/authentication/login_repository.dart';
import '../datasources/remote/auth_api.dart';
import '../datasources/remote/login_remote_datasource.dart';
import '../models/login_request_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthApi api;

  LoginRepositoryImpl(this.api);

  @override
  Future<String> login(LoginRequestModel request) async {
    final response = await api.login(request);
    return response.token; // JWT dal backend
  }
}
