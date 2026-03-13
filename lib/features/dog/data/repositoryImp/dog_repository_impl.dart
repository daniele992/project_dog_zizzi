import 'package:project_dog_zizzi/services/token_service.dart';

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
  final TokenStorage tokenStorage;

  DogRepositoryImpl(this.remoteDataSource, this.tokenStorage);

  @override
  Future<void> addDog(Dog dog) {
    final model = DogModel.fromEntity(dog);
    return remoteDataSource.addDog(model);
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
}