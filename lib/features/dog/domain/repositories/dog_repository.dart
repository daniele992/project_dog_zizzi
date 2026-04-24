import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:project_dog_zizzi/features/dog/domain/entities/dog_energy_level.dart';
import '../entities/dog.dart';
import '../entities/dog_gender.dart';

/*Il repository non conosce HTTP ma conosce da dove arrivano i dati e che tipo di dati ritorna.
il repository è un intermediario: decide da dove arrivano i dati (oggi potrebbe essere API REMOTA e domani Cache/Mock ecc.
IL REPOSITORY E' IL CERVELLO LOGISTICO DEI DATI. DECIDE DA DOVE ARRIVANO MA NON SA COME VENGONO MOSTRATI
 */


abstract class DogRepository {
  Future<void> addDog(Dog dog, {XFile? imageFile});

  Future<List<Dog>>getDogsByUser({
    required int userId,
    bool? isAdmin
  });

  Future<List<EnergyLevelDog>> getEnergyLevels();

  Future<List<DogGender>> getGenderDog();
}

