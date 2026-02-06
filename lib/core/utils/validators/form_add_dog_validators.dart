import 'package:bad_words/bad_words.dart';
import '../../constants/text_strings.dart';

class FormDogValidator{

  static String? validateNameDog(String? value){
    final Filter filter = Filter();
    if (value == null || value.trim().isEmpty) {return tNameDogCannotEmpty;}
    final lettersOnlyRegex = RegExp(r'^[a-zA-ZàèéìòùÀÈÉÌÒÙ\s\-]+$');
    if (!lettersOnlyRegex.hasMatch(value)) {return tOnlyLetters;}
    // Filters offensive words.
    if (filter.isProfane(value)) {return tBadWords;}
    return null;
  }

  static String? validateAgeDog(String? value) {
    if (value == null || value.isEmpty) {
      return "Il campo non può essere vuoto";
    }

    final numberOnlyRegex = RegExp(r'^\d+$');
    if (!numberOnlyRegex.hasMatch(value)) {
      return "Inserisci solo numeri";
    }

    final intVal = int.parse(value);
    if (intVal < 0) return "L'età non può essere negativa";
    if (intVal > 100) return "L'età non può essere superiore a 100";

    return null;
  }

  static String? validateBreed (String? value) {
    final Filter filter = Filter();
    if(value == null || value.trim().isEmpty) {return "";}
    final lettersOnlyRegex = RegExp(r'^[a-zA-ZàèéìòùÀÈÉÌÒÙ\s\-]+$');
    if (!lettersOnlyRegex.hasMatch(value)) {return tOnlyLetters;}
    // Filters offensive words.
    if (filter.isProfane(value)) {return tBadWords;}
    return null;

  }
}