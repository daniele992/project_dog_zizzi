import 'dart:convert';
import 'package:http/http.dart' as http;

///Classe di eccezione personalizzata per gestire errori legati all'autenticazione
 class AuthException implements Exception{
   final String message;
   AuthException(this.message);

   @override
   String toString() => "AuthException: $message"; //ToString() restituisce una descrizione leggibile dell'eccezione
 }

///Questo dataSource gestisce la registrazione utente via HTTP. Tutti gli errori vengono convertiti in AuthException.
abstract class AuthRemoteDataSource {
  Future<bool> register(Map<String, dynamic> data);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<bool> register(Map<String, dynamic> data) async {
    try {
      final response = await client.post(
        Uri.parse('http://localhost:5059/api/auth/register'), //Uri.parse('http://10.0.2.2:5059/api/auth/register') Nel caso dovessi usare Flutter Android Emulator
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if(response.statusCode == 200){ return true; }
      else {
        throw AuthException(
         //Body della risposta per debug
        "Registrazione fallita: ${response.statusCode} - ${response.body}");
      }
    } catch (e){
      //Rilancio di un'eccezione personalizzata se qualcosa va storto
      throw AuthException("Errore durante la registrazione: $e");
    }
  }
}