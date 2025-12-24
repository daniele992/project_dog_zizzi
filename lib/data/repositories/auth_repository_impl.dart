import 'package:project_dog_zizzi/data/models/user_registration_model.dart';
import '../../domain/repositories/authentication/registration_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';

///Questo repository nasconde i dettagli della rete al resto dell'applicazione.
///Si occupa di trasformare il modello n JSON e gestice gli errori in modo semplic.
///Pronto per essere usato da UseCases o ViewModels senza preoccuparsi dei dettagli di rete.
class AuthRepositoryImpl implements RegistrationRepository{
  final AuthRemoteDataSource dataSource; //Classe che effettivamente fa la chiamata HTTP

  AuthRepositoryImpl(this.dataSource); //Iniettiamo il datasource tramite il costruttore. Utile per la testabilità perchè si puà passare un mock del datasource

  @override
  Future<bool> register(UserRegistrationModel user) async {
    try{
      return await dataSource.register(user.toJson());
    } catch (e){
      //log dell'errore
      print('Errore registrazione: $e');
      return false;
    }
  }
}