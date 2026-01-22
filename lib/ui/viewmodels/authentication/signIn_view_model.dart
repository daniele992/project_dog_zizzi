import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../data/models/login_request_model.dart';
import '../../../domain/usecases/login_user.dart';

class LoginViewModel extends StateNotifier<AsyncValue<bool>> {
  final LoginUser loginUser;
  final storage = const FlutterSecureStorage();

  LoginViewModel(this.loginUser) : super(const AsyncValue.data(false));

  Future<void> login(LoginRequestModel request) async {

    try {
      state = const AsyncValue.loading();

      // LOGIN --> ricevo JWT
      final token = await loginUser(request);

      //Salvo il Token
      await storage.write(key: 'jwt', value: token);

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