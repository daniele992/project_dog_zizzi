import 'package:project_dog_zizzi/data/models/user_registration_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<bool> register(UserRegistrationModel user) async {
    return await dataSource.register(user.toJson() as UserRegistrationModel);
  }
}