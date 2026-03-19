import 'package:project_dog_zizzi/features/dog/domain/entities/dog_gender.dart';
import '../../domain/repositories/dog_repository.dart';

class GetDogGenderUseCase {
  final DogRepository repository;

  GetDogGenderUseCase(this.repository);

  Future<List<DogGender>> call(){
    return repository.getGenderDog();
  }

}