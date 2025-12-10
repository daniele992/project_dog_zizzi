class UserRegistrationModel {
  final String username;
  final String email;
  final String password;
  final bool privacyPolicy;
  final bool conditions;
  final bool admin;

  //Constructor User
  UserRegistrationModel({
    required this.username,
    required this.email,
    required this.password,
    required this.privacyPolicy,
    required this.conditions,
    required this.admin,
  });

  /*Metodo Dart che serve a convertire un oggetto dalla classe in un oggetto JSON Così può essere inviato al servere tramite una richiesta HTTP.
  In pratica prende i campi della classe, li mette dentro una mappa, restituisce un JSON pronto per essere inviato all'API.
  "Trasforma questo oggetto Dart in un contenitore di dati che il backend può capire". */
  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "acceptPrivacy": privacyPolicy,
    "acceptTerms": conditions,
    "admin": false
  };
}