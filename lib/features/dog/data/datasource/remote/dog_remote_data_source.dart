import 'dart:convert';
import 'dart:io';
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
  Future<void> addDog(
      DogModel dog,
      String token,
      {XFile? imageFile}) async {

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConstants.baseUrl}/Dogs'),
    );
    //HEADERS
    request.headers["Authorization"] = 'Bearer $token';

    //CAMPI (NON JSON!)
    request.fields['ownerId'] = dog.ownerId.toString();
    request.fields['name'] = dog.name;
    request.fields['age'] = dog.age.toString();
    request.fields['gender'] = dog.gender;
    request.fields['breed'] = dog.breed;
    request.fields['socialization'] = dog.socialization;
    request.fields['fearsOrPhobias'] = dog.fearsOrPhobias;
    request.fields['energyLevel'] = dog.energyLevel;
    request.fields['notesHealth'] = dog.notesHealth;
    request.fields['allergy'] = dog.allergy;
    request.fields['foodIntolerances'] = dog.foodIntolerances;
    request.fields['pathologies'] = dog.pathologies;
    request.fields['typeFood'] = dog.typeFood;
    request.fields['notesBehavioral'] = dog.notesBehavioral;

    //IMMAGINE (Opzionale)
    if(imageFile != null){
      final bytes = await imageFile.readAsBytes();

      request.files.add(
        http.MultipartFile.fromBytes(
            'image',
            bytes,
            filename: imageFile.name,
        ),
      );
    }

    final response = await request.send();

    if(response.statusCode != 200 &&
        response.statusCode != 201){
      throw Exception(tErrorInsertDog);
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
