import 'package:project_dog_zizzi/features/auth/domain/entities/user_registration_model.dart';
import '../../domain/repositories/registration_repository.dart';

class RegisterUser {
  final RegistrationRepository repository;

  RegisterUser(this.repository);

  Future<bool> call(UserRegistrationModel user) async{
    return await repository.register(user);
  }
}