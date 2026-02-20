import '../../../data/models/listUsers_model.dart';

/*Il repository non conosce HTTP ma conosce da dove arrivano i dati e che tipo di dati ritorna.
il repository è un intermediario: decide da dove arrivano i dati (oggi potrebbe essere API REMOTA e domani Cache/Mock ecc.
IL REPOSITORY E' IL CERVELLO LOGISTICO DEI DATI. DECIDE DA DOVE ARRIVANO MA NON SA COME VENGONO MOSTRATI
 */

///Serve come contratto
abstract class UserRepository {
  Future<List<UserModel>> getUsers({bool? isAdmin});
  Future<void> deleteUser(int id); //Oppure String id (in base al model)
}