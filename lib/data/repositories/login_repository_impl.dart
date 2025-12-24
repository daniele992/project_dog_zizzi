import '../../domain/repositories/authentication/login_repository.dart';
import '../datasources/remote/login_remote_datasource.dart';
import '../models/login_request_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl(this.loginRemoteDataSource);

  @override
  Future<bool> login(LoginRequestModel request) {
    return loginRemoteDataSource.login(request);
  }
}