import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/data/models/user_registration_model.dart';
import 'package:project_dog_zizzi/domain/usecases/register_user.dart';

class SignUpViewModel extends StateNotifier<AsyncValue<bool>> {
  final RegisterUser registerUser;

  SignUpViewModel(this.registerUser) : super(const AsyncValue.data(false));

  Future<void> register(UserRegistrationModel user) async {
    try{
      state = const AsyncValue.loading();

      final result = await registerUser(user);
      state = AsyncValue.data(result);
    } catch(e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}