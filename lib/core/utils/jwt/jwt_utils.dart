import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project_dog_zizzi/core/constants/jwt_claims.dart';

class JwtUtils {
  ///Funzione per recuperare userName dal token
  static String? getUserNameFromToken(String token) {
    if (JwtDecoder.isExpired(token)) return null;
    final decoded = JwtDecoder.decode(token);

    final name = decoded[JwtClaims.name] as String?;
    final surname = decoded[JwtClaims.surname] as String?;

    if (name == null || surname == null) return null;

    return '$name $surname';
  }

  ///Funzione per recuperare isAdmin dal token
  static bool isAdminFromToken(String token) {
    if (JwtDecoder.isExpired(token)) return false;
    final decoded = JwtDecoder.decode(token);
    final adminValue = decoded[JwtClaims.admin];
    if (adminValue == null) return false;
    if (adminValue is bool) return adminValue;

    //se arriva String "True/False"
    if (adminValue is String) return adminValue.toLowerCase() == 'true';

    //fallback
    return false;
  }

  ///Funzione per recuperare userId dal token
  static int? getUserIdFromToken(String token) {
    if (JwtDecoder.isExpired(token)) return null;

    final decoded = JwtDecoder.decode(token);

    //final userIdValue = decoded['userId'];

    /*Spesso nei JWT L'id non si chiama ownerId. Quindi questa è una versione più robusta
    final userIdValue =
        decoded['ownerId'] ??
        decoded['nameid'] ??
        decoded['sub'] ??
        decoded['id'] ??
        decoded['userId']; */
    final userIdValue = decoded[JwtClaims.userId];

    if (userIdValue == null) return null;

    if (userIdValue is int) return userIdValue;

    return int.tryParse(userIdValue.toString());
  }
}
