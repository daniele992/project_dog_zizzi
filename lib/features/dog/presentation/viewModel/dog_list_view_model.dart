import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/usecase/gets_dogs_by_user.dart';
import '../../domain/entities/dog.dart';

class DogListViewModel
    extends StateNotifier<AsyncValue<List<Dog>>> {

  final GetDogsByUserUseCase _getDogsByUserUseCase;

  DogListViewModel(this._getDogsByUserUseCase)
      : super(const AsyncLoading());

  Future<void> loadDogs(int userId) async {

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await _getDogsByUserUseCase(userId);
    });
  }
}