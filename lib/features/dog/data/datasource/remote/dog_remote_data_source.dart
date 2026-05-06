import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:project_dog_zizzi/core/constants/api_constants.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../models/dog_model.dart';

//Il datasource lavora solo con i model
abstract class DogRemoteDataSource {
  Future<void> addDog(DogModel dog, String token, {XFile? imageFile});
  Future<List<DogModel>> getDogsByUser({
    required String token,
    required int userId,
    bool? isAdmin,
  });
}

class DogRemoteDataSourceImpl implements DogRemoteDataSource {
  final http.Client client;

  DogRemoteDataSourceImpl(this.client);

  @override
  Future<void> addDog(DogModel dog, String token,{XFile? imageFile}) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConstants.baseUrl}/dogs'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    //Campi devono combaciare con DTO del backend
    request.fields['Name'] = dog.name;
    request.fields['Age'] = dog.age.toString();
    request.fields['Gender'] = dog.gender;
    request.fields['Breed'] = dog.breed;

    request.fields['Allergy'] = dog.allergy;
    request.fields['FoodIntolerances'] = dog.foodIntolerances;
    request.fields['TypeFood'] = dog.typeFood;
    request.fields['Pathologies'] = dog.pathologies;
    request.fields['NotesHealth'] = dog.notesHealth;

    request.fields['Socialization'] = dog.socialization;
    request.fields['FearsOrPhobias'] = dog.fearsOrPhobias;
    request.fields['EnergyLevel'] = dog.energyLevel;
    request.fields['NotesBehavioral'] = dog.notesBehavioral;

    //IMMAGINE
    if(imageFile != null){
      final bytes = await imageFile.readAsBytes();

      request.files.add(
        await http.MultipartFile.fromBytes(
          'Image',
          bytes,
          filename: imageFile.name,
        ),
      );
    }

    final response = await request.send();

    if(response.statusCode != 200 && response.statusCode != 201){
      throw Exception("Errore inserimento cani");
    }

  }



  @override
  Future<List<DogModel>> getDogsByUser({
    required String token,
    required int userId,
    bool? isAdmin,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/Dogs/user/$userId').replace(
      queryParameters: isAdmin != null
          ? {'isAdmin': isAdmin.toString().toLowerCase()}
          : null,
    );

    final response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => DogModel.fromJson(e)).toList();
    } else {
      throw Exception(tErrorRecovery);
    }
  }
}
