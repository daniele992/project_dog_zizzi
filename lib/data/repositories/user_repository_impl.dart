import 'package:project_dog_zizzi/data/datasources/remote/user_remote_datasource.dart';
import 'package:project_dog_zizzi/domain/repositories/user/user_repository.dart';
import '../models/listUsers_model.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<UserModel>> getUsers({bool? isAdmin}) async {
    return remoteDatasource.fetchUsers(isAdmin: isAdmin);
  }
}