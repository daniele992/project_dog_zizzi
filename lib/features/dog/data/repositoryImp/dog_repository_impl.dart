import '../../domain/entities/dog.dart';
import '../../domain/repositories/dog_repository.dart';
import '../datasource/remote/dog_remote_data_source.dart';
import '../models/dog_model.dart';

/*Qui succede la conversione tra Entity <-> Model
 ENTITY -> MODEL -> API
 API -> MODEL -> ENTITY
*/
class DogRepositoryImpl implements DogRepository {

  final DogRemoteDataSource remoteDataSource;

  DogRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addDog(Dog dog) {
    final model = DogModel.fromEntity(dog);
    return remoteDataSource.addDog(model);
  }

  @override
  Future<List<Dog>> getDogsByUser(int userId) async {
    final models = await remoteDataSource.getDogsByUser(userId);
    return models; // DogModel estende Dog
  }
}