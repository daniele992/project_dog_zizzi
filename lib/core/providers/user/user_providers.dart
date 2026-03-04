import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/token/auth_token_provider.dart';
import 'package:project_dog_zizzi/features/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:project_dog_zizzi/features/user/data/repositoryImp/user_repository_impl.dart';
import 'package:project_dog_zizzi/features/user/application/usecase/get_users.dart';
import 'package:project_dog_zizzi/features/user/presentation/viewModel/delete_user_view_model.dart';
import '../../../features/user/domain/entities/listUsers_model.dart';
import '../../../features/user/application/usecase/delete_user.dart';
import '../../../features/user/presentation/viewModel/delete_user_state.dart';
import '../../../features/user/presentation/viewModel/user_view_model.dart';


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

final deleteUserProvider = Provider(
    (ref) => DeleteUser(ref.read(userRepositoryProvider)),
);

final deleteUserViewModelProvider = StateNotifierProvider<DeleteUserViewModel, DeleteUserState>(
    (ref) => DeleteUserViewModel(
      ref.read(deleteUserProvider),
    ),
);

//Provider ViewModel
final userViewModelProvider = StateNotifierProvider<UserViewModel, AsyncValue<List<UserModel>>>(
    (ref) => UserViewModel(
        ref.read(getUserProvider),
    ),
);