import '../../repositories/user/user_repository.dart';

class DeleteUser{
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<void> call(int userId) async{
    return await repository.deleteUser(userId);
  }

}