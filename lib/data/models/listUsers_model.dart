//Modello dati per la lista utenti
//Regola d'oro 1 endpoint = 1 model
class UserModel{
  final int id;
  final String name;
  final String surname;
  final String email;
  final bool admin;
  final DateTime createdAt;
  final bool acceptTerms;
  final bool acceptPrivacy;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.admin,
    required this.createdAt,
    required this.acceptTerms,
    required this.acceptPrivacy
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
        admin: json['admin'],
        createdAt: DateTime.parse(json['createdAt']),
        acceptTerms: json['acceptTerms'],
        acceptPrivacy: json['acceptPrivacy'],
    );
  }
}