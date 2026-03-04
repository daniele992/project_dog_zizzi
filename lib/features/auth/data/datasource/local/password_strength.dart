class PasswordStrength {
  final int strength;
  final List<String> hints;

  PasswordStrength(this.strength, this.hints);

  String strengthToString(){
    if(strength <= 3) return "Debole";
    if(strength <= 6) return "Media";
    return "Forte";
  }
}