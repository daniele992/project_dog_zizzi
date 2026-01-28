import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/jwt/jwt_utils.dart';

final userFullNameProvider = FutureProvider<String?>((ref) async {
  return JwtUtils.getUserName();
});

final userIsAdmin = FutureProvider<bool>((ref) async {
  return JwtUtils.isAdmin();
});

/* ERRORE PERCHE':
  -  Questo provider viene eseguito una volta
  -  Non sa quando faccio il login, quindi rimane con valore Null
 */
/* final userFullNameProvider = FutureProvider<String>((ref) async {
  return await JwtUtils.getUserName() ?? 'Utente';
}); */