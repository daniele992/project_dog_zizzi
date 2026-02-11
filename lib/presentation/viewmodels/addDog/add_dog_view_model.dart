import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/data/models/addDogModel.dart';
import '../../../domain/usecases/add_dog.dart';


class AddDogViewModel extends StateNotifier<AsyncValue<void>>{
  final AddDogUseCase _addDogUseCase;

  AddDogViewModel(this._addDogUseCase) : super(const AsyncData(null));

  Future<void> addDog(AddDogModel model) async {
    state = const AsyncLoading();

    /*
    AsyncValue.guard gestisce automaticamente: Try, Catch, Error, Loading
    Riperpood + progettato per lavorare con stati asincroni.
    AsyncValue è: Reattivo, Sicuro, Standard Riverpood, Minimal.
    è il modo ufficiale consigliato
    */
    state = await AsyncValue.guard(() async {
      await _addDogUseCase(model);
    });
  }
}
