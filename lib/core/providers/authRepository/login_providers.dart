import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/core/providers/token/auth_token_provider.dart';
import '../../../data/datasources/remote/auth_api.dart';
import '../../../data/repositories/login_repository_impl.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../presentation/viewmodels/authentication/signIn_view_model.dart';



final httpClientProvider = Provider((_) => http.Client());

final authApiProvider = Provider(
      (ref) => AuthApi(
    client: ref.read(httpClientProvider),
    baseUrl: 'http://localhost:5059', // cambia se serve
  ),
);

final loginRepositoryProvider = Provider(
      (ref) => LoginRepositoryImpl(ref.read(authApiProvider)),
);

final loginUserProvider = Provider(
      (ref) => LoginUser(ref.read(loginRepositoryProvider)),
);

/*final loginViewModelProvider =
StateNotifierProvider<LoginViewModel, AsyncValue<bool>>(
      (ref) => LoginViewModel(ref.read(loginUserProvider)),
); */

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<bool>>(
    (ref) => LoginViewModel(
        ref.read(loginUserProvider),
        ref.read(tokenStorageProvider),
    ),
);