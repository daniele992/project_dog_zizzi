import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../application/usecase/add_dog.dart';
import '../../domain/entities/dog.dart';

class AddDogViewModel extends StateNotifier<AsyncValue<void>> {

  final AddDogUseCase _addDogUseCase;

  AddDogViewModel(this._addDogUseCase)
      : super(const AsyncData(null));

  Future<void> addDog(Dog dog, {XFile? imageFile}) async {

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _addDogUseCase(dog, imageFile: imageFile);
    });
  }
}