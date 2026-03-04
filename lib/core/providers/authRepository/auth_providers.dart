import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/features/auth/data/repositoryImp/auth_repository_impl.dart';
import 'package:project_dog_zizzi/features/auth/application/usecase/register_user.dart';
import '../../../features/auth/data/datasource/remote/auth_remote_datasource.dart';
import '../../../features/auth/presentation/viewModel/sign_up_state.dart';
import '../../../features/auth/presentation/viewModel/signup_view_model.dart';

/*
* UI non conosce HTTP
* UI non conosce Token
* UI non conosce Repository
* UI conosce solo il viewModel
* Questà è clean Architecture vera
* */

//Datasource
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(http.Client());
});


//Repository
final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

//Usecase
final registerUserProvider = Provider<RegisterUser>((ref){
  return RegisterUser(ref.read(authRepositoryProvider));
});

//ViewModel
final signUpViewModelProvider = StateNotifierProvider<SignUpViewModel, SignUpState>((ref) {
  return SignUpViewModel(ref.read(registerUserProvider));
});