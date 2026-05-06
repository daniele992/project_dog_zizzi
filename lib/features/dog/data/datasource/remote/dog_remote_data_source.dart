import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/core/constants/api_constants.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../models/dog_model.dart';

//Il datasource lavora solo con i model
abstract class DogRemoteDataSource {
  Future<void> addDog(DogModel dog, String token);
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
  Future<void> addDog(DogModel dog, String token) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/dogs'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(dog.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Errore inserimento cane");
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
