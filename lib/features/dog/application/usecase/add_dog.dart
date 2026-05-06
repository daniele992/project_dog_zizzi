import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../domain/entities/dog.dart';
import '../../domain/repositories/dog_repository.dart';

/* Un UseCasen rappresenta un azione del dominio: "Ottieni utenti", "Login utente"
è il cuore della clean architecture e non sa nulla di: HTTP, TOKEN, API, DATABASE
lo UseCase descrive COSA vuoi fare e non COME vuoi farlo*/

class AddDogUseCase{
  final DogRepository repository;

  AddDogUseCase(this.repository);

  Future<void> call(Dog dog, {XFile? imageFile}){
    return repository.addDog(dog, imageFile: imageFile);
  }
}