import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_dog_zizzi/core/utils/token_service.dart';

import '../dog/dog_providers.dart';
import '../dog/dropdown_add_dog_provider.dart';

//Secure storage
final secureStorageProvider = Provider((_) => const FlutterSecureStorage());

//Token storage wrapper
final tokenStorageProvider = Provider(
      (ref) => TokenStorage(ref.read(secureStorageProvider)),
);

//JWT provider (READ ONLY)
final authTokenProvider = FutureProvider<String?>(
    (ref) => ref.read(tokenStorageProvider).getToken(),
);

final logoutTokenProvider = Provider((ref) {
  return () async {
    final tokenStorage = ref.read(tokenStorageProvider);
    await tokenStorage.deleteToken();

    //Cancellazione delle cache e forza il reload pulito
    ref.invalidate(dogListViewModelProvider);
    ref.invalidate(energyLevelProvider);
    ref.invalidate(genderProvider);

    //reset di altri provider se necessario

  };
});