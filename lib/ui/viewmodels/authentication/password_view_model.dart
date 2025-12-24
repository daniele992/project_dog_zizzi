import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/text_strings.dart';
import 'package:project_dog_zizzi/data/datasources/local/password_strength.dart';

final passwordProvider = StateProvider<String>((ref) => "");

// Provider mutabile della forza
final passwordStrengthProvider = StateNotifierProvider<PasswordStrengthNotifier, PasswordStrength>((ref) {
  return PasswordStrengthNotifier();
});

class PasswordStrengthNotifier extends StateNotifier<PasswordStrength> {
  PasswordStrengthNotifier() : super(PasswordStrength(0, []));

  void calculate(String password) {
    int strength = 0;
    List<String> hints = [];

    if (password.length >= 8) { strength += 2; } else { hints.add(tAddEightCharacters); }
    if (password.length >= 12) { strength += 2; }
    if (RegExp(r'[a-z]').hasMatch(password)) { strength += 1; } else { hints.add(tAddLowercase); }
    if (RegExp(r'[A-Z]').hasMatch(password)) { strength += 1; } else { hints.add(tAddUppercase); }
    if (RegExp(r'\d').hasMatch(password)) { strength += 2; } else { hints.add(tAddNumber); }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) { strength += 2; } else { hints.add(tAddSpecialCharacters); }

    state = PasswordStrength(strength, hints);
  }

  void reset() {
    state = PasswordStrength(0, []);
  }
}