import 'package:project_dog_zizzi/data/models/listUsers_model.dart';
import '../../repositories/user/user_repository.dart';

/* Un UseCase rappresenta un azione del dominio: "Ottieni utenti", "Login utente"
è il cuore della clean architecture e non sa nulla di: HTTP, TOKEN, API, DATABASE
lo UseCase descrive COSA vuoi fare e non COME vuoi farlo*/

class GetUsers {
  final UserRepository repository; //Il UseCase dipende dal respository

  GetUsers(this.repository);

  //call è un metodo speciale in Dart che consciende di usare l'oggetto come se fosse una funzione
  Future<List<UserModel>> call({bool? isAdmin}) async {
    return repository.getUsers(isAdmin: isAdmin); //Qui dice solo "Repository, dammi gli utenti".
  }
}

