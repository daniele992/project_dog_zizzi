import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/presentation/viewmodels/authentication/sign_up_state.dart';
import '../../../core/constants/text_strings.dart';
import '../../../data/datasources/remote/auth_remote_datasource.dart';
import '../../../data/models/user_registration_model.dart';
import '../../../domain/usecases/register_user.dart';


class SignUpViewModel extends StateNotifier<SignUpState> {
  final RegisterUser registerUser;

  SignUpViewModel(this.registerUser) : super(const SignUpState());

  Future<void> register(UserRegistrationModel user) async {
    // Imposta lo stato su loading
    state = state.copyWith(isLoading: true, isSuccess: false, errorMessage: null);

    try {
      final success = await registerUser(user);

      if (success) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      } else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: tRegistrationFailed,
        );
      }
    } on AuthException catch (e) {
      // Errore personalizzato dal datasource
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.message,
      );
    } catch (e) {
      // Altri errori generici
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: '$tUnexpectedError: $e',
      );
    }
  }

  // Facoltativo: reset dello stato
  void reset() {
    state = const SignUpState();
  }
}
