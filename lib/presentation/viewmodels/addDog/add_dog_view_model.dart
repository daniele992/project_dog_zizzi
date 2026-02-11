import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/data/models/addDogModel.dart';
import 'package:project_dog_zizzi/domain/usecases/add_dog.dart';

class AddDogState {
  final bool isLoading;
  final String? error;

  const AddDogState({this.isLoading = false, this.error});
}

class AddDogViewModel extends StateNotifier<AddDogState>{
  final AddDogUseCase addDogUseCase;

  AddDogViewModel(this.addDogUseCase) : super(const AddDogState());

  Future<void> addDog(AddDogModel dog) async {
    state = const AddDogState(isLoading: true);

    try{
      await addDogUseCase(dog);
      state = const AddDogState();
    } catch (e) {
     state = AddDogState(error: e.toString());
    }
  }
}
