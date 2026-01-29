class UserRegistrationModel {
  final String name;
  final String surname;
  final String email;
  final String password;
  final bool privacyPolicy;
  final bool conditions;
  final bool admin;

  //Constructor User
  UserRegistrationModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.privacyPolicy,
    required this.conditions,
    required this.admin,
  });

  /*Metodo Dart che serve a convertire un oggetto dalla classe in un oggetto JSON Così può essere inviato al servere tramite una richiesta HTTP.
  In pratica prende i campi della classe, li mette dentro una mappa, restituisce un JSON pronto per essere inviato all'API.
  "Trasforma questo oggetto Dart in un contenitore di dati che il backend può capire".
  toJson è pensato solo per POST e non per GET*/
  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "email": email,
    "password": password,
    "acceptPrivacy": privacyPolicy,
    "acceptTerms": conditions,
    "admin": false
  };
}