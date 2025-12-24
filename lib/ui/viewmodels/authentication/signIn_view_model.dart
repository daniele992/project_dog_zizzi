import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/login_request_model.dart';
import '../../../domain/usecases/login_user.dart';

class LoginViewModel extends StateNotifier<AsyncValue<bool>> {
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
}