import 'package:project_dog_zizzi/features/dog/domain/entities/dog_energy_level.dart';
import '../../domain/repositories/dog_repository.dart';

class GetEnergyLevelUseCase {
  final DogRepository repository;

  GetEnergyLevelUseCase(this.repository);

  Future<List<EnergyLevelDog>> call() {
    return repository.getEnergyLevels();
  }


}