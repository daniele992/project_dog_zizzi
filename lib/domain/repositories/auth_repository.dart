import 'package:project_dog_zizzi/data/models/user_registration_model.dart';

abstract class AuthRepository {
  Future<bool> register(UserRegistrationModel user);
}