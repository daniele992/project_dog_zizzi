import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/services/token_service.dart';
import '../../../data/models/login_request_model.dart';
import '../../../domain/usecases/user/login_user.dart';

class LoginViewModel extends StateNotifier<AsyncValue<bool>> {
  final LoginUser loginUser;
  final TokenStorage tokenStorage;

  LoginViewModel(this.loginUser, this.tokenStorage) : super(const AsyncValue.data(false));

  Future<void> login(LoginRequestModel request) async { //Future<void> login(String email, String password) async {}

    try {
      state = const AsyncValue.loading();

      // LOGIN --> ricevo JWT
      final token = await loginUser(request);  //final toke = await loginUser(email, password);

      //Salvo il Token
      await tokenStorage.saveToken(token);

      state = const AsyncValue.data(true);

    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }

  }
}


/*class LoginViewModel extends StateNotifier<AsyncValue<bool>> {
  final LoginUser loginUser;

  LoginViewModel(this.loginUser) : super(const AsyncValue.data(false));

  Future<void> login(LoginRequestModel request) async {
    try {
      state = const AsyncValue.loading();
      final result = await loginUser(request);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
} */