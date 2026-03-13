import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/core/constants/api_constants.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../models/dog_model.dart';

abstract class DogRemoteDataSource {
  Future<void> addDog(DogModel dog);
  Future<List<DogModel>> getDogsByUser(int userId);
}

class DogRemoteDataSourceImpl implements DogRemoteDataSource {

  final http.Client client;

  DogRemoteDataSourceImpl(this.client);

  @override
  Future<void> addDog(DogModel dog) async {

    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}/Dogs'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(dog.toJson()),
    );

    if (response.statusCode != 200 &&
        response.statusCode != 201) {
      throw Exception(tErrorInsertDog);
    }
  }

  @override
  Future<List<DogModel>> getDogsByUser(int userId) async {

    final response = await client.get(
      Uri.parse('${ApiConstants.baseUrl}/Dogs/user/$userId'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => DogModel.fromJson(e)).toList();
    } else {
      throw Exception(tErrorRecovery);
    }
  }
}