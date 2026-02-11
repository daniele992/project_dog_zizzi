import 'package:project_dog_zizzi/data/models/addDogModel.dart';
import 'package:project_dog_zizzi/domain/repositories/add_dog/add_dog_repository.dart';
import '../datasources/remote/add_dog_remote_data_source.dart';

class AddDogRepositoryImpl implements AddDogRepository{
  final AddDogRemoteDataSource remoteDataSource;

  AddDogRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addDog(AddDogModel dog) {
    return remoteDataSource.addDog(dog);
  }
}