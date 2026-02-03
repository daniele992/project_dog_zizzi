import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/token/auth_token_provider.dart';
import '../../utils/jwt/jwt_utils.dart';

final userFullNameProvider = Provider<AsyncValue<String?>>((ref) {
  final tokenAsync = ref.watch(authTokenProvider);

  return tokenAsync.when(
    data: (token) {
      if (token == null) return const AsyncValue.data(null);
      return AsyncValue.data(JwtUtils.getUserNameFromToken(token));
    },
    loading: () => const AsyncValue.loading(),
    error: (e, st) => AsyncValue.error(e, st),
  );
});

final userIsAdminProvider = Provider<AsyncValue<bool>>((ref) {
  final tokenAsync = ref.watch(authTokenProvider);

  return tokenAsync.when(
    data: (token) {
      if (token == null) return const AsyncValue.data(false);
      return AsyncValue.data(JwtUtils.isAdminFromToken(token));
    },
    loading: () => const AsyncValue.loading(),
    error: (e, st) => AsyncValue.error(e, st),
  );
});


/* ERRORE PERCHE':
  -  Questo provider viene eseguito una volta
  -  Non sa quando faccio il login, quindi rimane con valore Null
 */
/* final userFullNameProvider = FutureProvider<String>((ref) async {
  return await JwtUtils.getUserName() ?? 'Utente';
}); */