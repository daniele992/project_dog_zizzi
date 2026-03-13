import '../../domain/entities/dog.dart';
import '../../domain/repositories/dog_repository.dart';


class GetDogsByUserUseCase {
  final DogRepository repository;

  GetDogsByUserUseCase(this.repository);

  Future<List<Dog>> call(int userId) {
    return repository.getDogsByUser(userId);
  }
}