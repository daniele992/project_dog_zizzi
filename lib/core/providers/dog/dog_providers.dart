import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../features/dog/application/usecase/add_dog.dart';
import '../../../features/dog/application/usecase/gets_dogs_by_user.dart';
import '../../../features/dog/data/datasource/remote/dog_remote_data_source.dart';
import '../../../features/dog/data/repositoryImp/dog_repository_impl.dart';
import '../../../features/dog/domain/entities/dog.dart';
import '../../../features/dog/domain/repositories/dog_repository.dart';
import '../../../features/dog/presentation/viewModel/add_dog_view_model.dart';
import '../../../features/dog/presentation/viewModel/dog_list_view_model.dart';

final httpClientProvider = Provider((ref) => http.Client());

//Provider che crea il Remote Data Source. Esso è il livello che parla direttamente con l'API
final dogRemoteDataSourceProvider = Provider(
      (ref) => DogRemoteDataSourceImpl(ref.read(httpClientProvider)),
);

//Provider che il crea il Repository. Esso prende i dati dal data source e li converte in entities
final dogRepositoryProvider = Provider<DogRepository>(
      (ref) => DogRepositoryImpl(ref.read(dogRemoteDataSourceProvider)),
);

//Crea lo UseCase per aggiungere un cane. Esso contiene la logica dell'applicazione
final addDogUseCaseProvider = Provider<AddDogUseCase>(
      (ref) => AddDogUseCase(ref.read(dogRepositoryProvider)),
);

//Crea lo usease per recuperare la lista di cani di un utente
final getDogsByUserUseCaseProvider = Provider<GetDogsByUserUseCase>(
      (ref) => GetDogsByUserUseCase(ref.read(dogRepositoryProvider)),
);

//Crea il viewModel per aggiungere un cane. Si usa StateNotifierProvider quindi significa che il view model gestisce uno stato
final addDogViewModelProvider = StateNotifierProvider<AddDogViewModel, AsyncValue<void>>(
      (ref) => AddDogViewModel(ref.read(addDogUseCaseProvider)),
);

//Provider che gestisce la lista dei cani
final dogListViewModelProvider = StateNotifierProvider<DogListViewModel, AsyncValue<List<Dog>>>(
      (ref) => DogListViewModel(ref.read(getDogsByUserUseCaseProvider)),
);