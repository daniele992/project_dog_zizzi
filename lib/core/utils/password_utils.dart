import 'package:flutter/material.dart';
import '../../data/datasources/local/password_strength.dart';

  Color getStrengthColor(PasswordStrength value) {
    if (value.strength <= 3) return Colors.red;
    if (value.strength <= 6) return Colors.orange;
    return Colors.green;

}