import 'package:project_dog_zizzi/features/dog/domain/entities/addDogModel.dart';
import 'package:project_dog_zizzi/features/dog/domain/repositories/add_dog_repository.dart';
import '../datasource/remote/add_dog_remote_data_source.dart';

class AddDogRepositoryImpl implements AddDogRepository{
  final AddDogRemoteDataSource remoteDataSource;

  AddDogRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addDog(AddDogModel dog) {
    return remoteDataSource.addDog(dog);
  }
}