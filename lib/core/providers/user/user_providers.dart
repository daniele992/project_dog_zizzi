import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/token/auth_token_provider.dart';
import 'package:project_dog_zizzi/data/datasources/remote/user_remote_datasource.dart';
import 'package:project_dog_zizzi/data/repositories/user_repository_impl.dart';
import 'package:project_dog_zizzi/domain/usecases/get_users.dart';
import '../../../data/models/listUsers_model.dart';
import '../../../presentation/viewmodels/listUser/listUsers_view_model.dart';

//Provider DataSource
final userRemoteDataSourceProvider = Provider(
    (ref) => UserRemoteDatasource(
        baseUrl: 'http://localhost:5059'
    ),
);

//Provider Repository
final userRepositoryProvider = Provider(
    (ref) => UserRepositoryImpl(
      ref.read(userRemoteDataSourceProvider),
      ref.read(tokenStorageProvider),
    ),
);

//Provider UseCase
final getUserProvider = Provider(
    (ref) => GetUsers(ref.read(userRepositoryProvider)),
);

//Provider ViewModel
final userViewModelProvider = StateNotifierProvider<UserViewModel, AsyncValue<List<UserModel>>>(
    (ref) => UserViewModel(ref.read(getUserProvider)),
);