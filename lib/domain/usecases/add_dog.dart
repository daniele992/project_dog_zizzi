import 'package:project_dog_zizzi/data/models/addDogModel.dart';
import '../repositories/add_dog/add_dog_repository.dart';

/* Un UseCasen rappresenta un azione del dominio: "Ottieni utenti", "Login utente"
è il cuore della clean architecture e non sa nulla di: HTTP, TOKEN, API, DATABASE
lo UseCase descrive COSA vuoi fare e non COME vuoi farlo*/

class AddDogUseCase{
  final AddDogRepository repository;

  AddDogUseCase(this.repository);

  Future<void> call(AddDogModel dog){
    return repository.addDog(dog);
  }
}