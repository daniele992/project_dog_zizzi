import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_dog_zizzi/data/models/listUsers_model.dart';
import '../../../core/constants/text_strings.dart';

///Questa classe parla solo con l'API remota
class UserRemoteDatasource {
  final String baseUrl;
  UserRemoteDatasource({required this.baseUrl});  //Costruttore. Devo fornire l'URL del server e il token.

  ///Metodo asincrono per tornare una lista di utenti
  Future<List<UserModel>> fetchUsers({required String token, bool? isAdmin}) async {

    final uri = Uri.parse('$baseUrl/api/user').replace(
      queryParameters: isAdmin != null ? {'isAdmin' : isAdmin.toString().toLowerCase()} : null); //.toLower.Case() perchè il backend vuole "true/"false" lowercase
    print('Token: $token');
    final response = await http.get(uri, headers: { //Chiamata HTTP GET e invio gli headers. Il backend leggere il token, verifica che sia valido, esegue la Query
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if(response.statusCode == 200){
      final List data = jsonDecode(response.body); //Decodifica il JSON
      return data.map((e) => UserModel.fromJson(e)).toList(); //data.map prendere ogni utente JOSN e lo trasforma in un oggetto Dart
    } else {
      throw Exception(tErrorDownloadUser);
    }
  }

  Future<void> deleteUser({
    required String token,
    required int id,
  }) async {

    final uri = Uri.parse('$baseUrl/api/User/$id');

    final response = await http.delete(
      uri,
      headers: {
        'Authorization' : 'Bearer $token',
        'Content-type' : 'application/json',
      }
    );

    if(response.statusCode == 200 || response.statusCode == 204){
      return; //delete avvenuta con successo
    } else {
      throw Exception('Errore durante eliminazione utente');
    }
  }
}



