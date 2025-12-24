import '../../../data/models/user_registration_model.dart';

abstract class RegistrationRepository {
  Future<bool> register(UserRegistrationModel request);
}