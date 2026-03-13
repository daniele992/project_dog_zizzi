import '../../domain/entities/dog.dart';
import '../../domain/repositories/dog_repository.dart';


class GetDogsByUserUseCase {
  final DogRepository repository;

  GetDogsByUserUseCase(this.repository);

  Future<List<Dog>> call({
    required int userId,
    bool? isAdmin,
  }) {
    return repository.getDogsByUser(userId: userId, isAdmin:isAdmin);
  }
}