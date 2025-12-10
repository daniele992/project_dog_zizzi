import 'package:project_dog_zizzi/data/models/user_registration_model.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<bool> call(UserRegistrationModel user) async{
    return await repository.register(user);
  }
}