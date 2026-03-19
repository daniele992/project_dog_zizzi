import 'package:project_dog_zizzi/features/dog/data/models/dog_energy_level_model.dart';
import 'package:project_dog_zizzi/features/dog/data/models/dog_gender_model.dart';
import 'package:project_dog_zizzi/services/token_service.dart';
import '../../domain/entities/dog.dart';
import '../../domain/entities/dog_energy_level.dart';
import '../../domain/entities/dog_gender.dart';
import '../../domain/repositories/dog_repository.dart';
import '../datasource/local/dog_local_data_source.dart';
import '../datasource/remote/dog_remote_data_source.dart';
import '../models/dog_model.dart';

/*Qui succede la conversione tra Entity <-> Model
 ENTITY -> MODEL -> API
 API -> MODEL -> ENTITY
*/
class DogRepositoryImpl implements DogRepository {

  final DogRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;
  final DogLocalDataSource localDataSource;

  DogRepositoryImpl(this.remoteDataSource, this.tokenStorage, this.localDataSource);

  @override
  Future<void> addDog(Dog dog) async {
    final token = await tokenStorage.getToken();
    if(token == null) throw Exception('Token mancante');
    final model = DogModel.fromEntity(dog);
    return remoteDataSource.addDog(model, token);
  }

  @override
  Future<List<Dog>>getDogsByUser({
    required int userId,
    bool? isAdmin
  }) async {
    final token = await tokenStorage.getToken();
    if(token == null) throw Exception('Token mancante');

    return remoteDataSource.getDogsByUser(
        token: token,
        userId: userId,
        isAdmin: isAdmin
    );
  }

  @override
  Future<List<EnergyLevelDog>> getEnergyLevels() async {
    final list = await localDataSource.getEnergyLevels();
    return list
        .map((e) => EnergyLevelDogModel.fromJson(e)
        .toEntity()).toList();
  }

  @override
  Future<List<DogGender>> getGenderDog() async {
    final list = await localDataSource.getDogGender();
    return list
        .map((e) => DogGenderModel.fromJson(e)
        .toEntity()).toList();

  }
}