import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/data/models/addDogModel.dart';

abstract class AddDogRemoteDataSource {
  Future<void> addDog(AddDogModel dog);
}

class AddDogRemoteDataSourceImpl implements AddDogRemoteDataSource{

  final http.Client client;

  AddDogRemoteDataSourceImpl(this.client);

  @override
  Future<void> addDog(AddDogModel dog) async{
   try {
     final response = await client.post(
       Uri.parse('http://localhost:5059/api/Dogs'),
       headers: {'Content-Type': 'application/json'},
       body: jsonEncode(dog.toJson()),
     );

     if(response.statusCode != 200 && response.statusCode != 201){
       throw Exception(
         'Inserimento amico a quattro zampe fallito: ${response.statusCode} - ${response.body}',
       );
     }
   }  catch (e) {
     throw Exception('Errore durante inserimento: $e');
   }
  }
}