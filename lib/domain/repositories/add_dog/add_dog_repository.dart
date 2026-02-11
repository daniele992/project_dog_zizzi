/*Il repository non conosce HTTP ma conosce da dove arrivano i dati e che tipo di dati ritorna.
il repository è un intermediario: decide da dove arrivano i dati (oggi potrebbe essere API REMOTA e domani Cache/Mock ecc.
IL REPOSITORY E' IL CERVELLO LOGISTICO DEI DATI. DECIDE DA DOVE ARRIVANO MA NON SA COME VENGONO MOSTRATI
 */

import 'package:project_dog_zizzi/data/models/addDogModel.dart';

abstract class AddDogRepository {
  Future<void> addDog(AddDogModel dog);
}