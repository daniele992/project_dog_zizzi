import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/features/dog/data/datasource/remote/add_dog_remote_data_source.dart';
import 'package:project_dog_zizzi/features/dog/data/repositoryImp/add_dog_repository_impl.dart';
import 'package:project_dog_zizzi/features/dog/application/usecase/add_dog.dart';

import '../../../features/dog/presentation/viewModel/add_dog_view_model.dart';

final httpClientProvider = Provider((ref) => http.Client());

final dogRemoteDataSourceProvider = Provider(
    (ref) => AddDogRemoteDataSourceImpl(ref.read(httpClientProvider)),
 );

final addDogRepositoryProvider = Provider(
    (ref) => AddDogRepositoryImpl(ref.read(dogRemoteDataSourceProvider))
);

final addDogUseCaseProvider = Provider(
    (ref) => AddDogUseCase(ref.read(addDogRepositoryProvider)),
);

final addDogViewModelProvider =
StateNotifierProvider<AddDogViewModel, AsyncValue<void>>(
     (ref) => AddDogViewModel(ref.read(addDogUseCaseProvider)),
);

