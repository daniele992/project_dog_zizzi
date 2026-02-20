import 'package:project_dog_zizzi/data/datasources/remote/user_remote_datasource.dart';
import 'package:project_dog_zizzi/domain/repositories/user/user_repository.dart';
import '../../core/constants/text_strings.dart';
import '../../services/token_service.dart';
import '../models/listUsers_model.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDatasource remoteDatasource;
  final TokenStorage tokenStorage;

  UserRepositoryImpl(
      this.remoteDatasource,
      this.tokenStorage,
      );

  @override
  Future<List<UserModel>> getUsers({bool? isAdmin}) async {

    final token = await tokenStorage.getToken();
    if(token == null) {
      throw Exception(tErrorNoToken);
    }

    return remoteDatasource.fetchUsers(
      token: token,
      isAdmin: isAdmin,
    );
  }

  @override
  Future<void> deleteUser(int id) async {
    final token = await tokenStorage.getToken();

    if(token == null){
      throw Exception(tErrorNoToken);
    }

    await remoteDatasource.deleteUser(
      token: token,
      id: id,
    );
  }
}