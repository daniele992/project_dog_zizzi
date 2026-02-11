import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/data/repositories/auth_repository_impl.dart';
import 'package:project_dog_zizzi/domain/usecases/register_user.dart';
import '../../../data/datasources/remote/auth_remote_datasource.dart';
import '../../../presentation/viewmodels/authentication/sign_up_state.dart';
import '../../../presentation/viewmodels/authentication/signup_view_model.dart';


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