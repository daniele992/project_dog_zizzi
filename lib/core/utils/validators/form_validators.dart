import 'package:bad_words/bad_words.dart';
import '../../constants/text_strings.dart';

class FormValidators {
  ///Checks that the email is not empty and is in a valid format.
  static String? validateEmail(value) {
    if(value == null || value.isEmpty){return tEmailCannotEmpty;}
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if(!emailRegex.hasMatch(value)){return tInvalidEmailFormat;}
    return null;
  }

  ///Checks that the name is not empty. Verifies it contains only letters (a-z, A-Z). Uses the bad_words library to filter offensive words and returns an error if any are found.
  static String? validateUsername(String? value) {

    final Filter filter = Filter();
    if (value == null || value.trim().isEmpty) {return tUsernameCannotEmpty;}
    if(value.length <= 3 && value.trim().isNotEmpty) {return tUsernameLength;}
    final lettersOnlyRegex = RegExp(r'^[a-zA-ZàèéìòùÀÈÉÌÒÙ\s\-]+$');
    if (!lettersOnlyRegex.hasMatch(value)) {return tOnlyLetters;}
    // Filters offensive words.
    if (filter.isProfane(value)) {return tBadWords;}
    return null;
  }

  ///Checks that the password is not empty and matches a pattern: at least 8 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special symbol.
  static String? validatePassword(value) {
    if (value == null || value.isEmpty) return tPasswordCannotEmpty;

    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {return tPasswordValue;}
    return null;
  }
}