import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/usecase/gets_dogs_by_user.dart';
import '../../domain/entities/dog.dart';


class DogListViewModel extends StateNotifier<AsyncValue<List<Dog>>> {
  final GetDogsByUserUseCase getDogs;

  DogListViewModel(this.getDogs) : super(const AsyncValue.loading());

  Future<void> fetchDogs({required int userId, bool? isAdmin}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => getDogs(userId: userId, isAdmin: isAdmin));
  }
}