import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/data/datasources/local/password_strength.dart';
import '../../../core/constants/text_strings.dart';

//State Password
final passwordProvider = StateProvider<String>((ref) => "");

//Provider that calculates the force using the ViewModel
final passwordStrengthProvider = Provider<PasswordStrength>((ref) {
  final password = ref.watch(passwordProvider);
  final viewModel = PasswordViewModel();
  return viewModel.strengthCalculate(password);
});

class PasswordViewModel {

  strengthCalculate(String password)
  {
    int strength = 0;
    List<String> hints = [];

    if (password.length >= 8) { strength += 2; }
    else { hints.add(tAddEightCharacters); }
    if (password.length >= 12) { strength += 2; }

    if (RegExp(r'[a-z]').hasMatch(password)) { strength += 1; }
    else { hints.add(tAddLowercase); }

    if (RegExp(r'[A-Z]').hasMatch(password)) { strength += 1; }
    else { hints.add(tAddUppercase); }

    if (RegExp(r'\d').hasMatch(password)) { strength += 2; }
    else { hints.add(tAddNumber); }

    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) { strength += 2; }
    else { hints.add(tAddSpecialCharacters); }

    return PasswordStrength(strength, hints);
  }
}