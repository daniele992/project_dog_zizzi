import 'package:project_dog_zizzi/data/models/user_registration_model.dart';
import '../../repositories/authentication/registration_repository.dart';

class RegisterUser {
  final RegistrationRepository repository;

  RegisterUser(this.repository);

  Future<bool> call(UserRegistrationModel user) async{
    return await repository.register(user);
  }
}