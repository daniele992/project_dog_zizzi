class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  // Questa riga è codice Dart e serve a convertire un oggetto in formato JSON.
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
