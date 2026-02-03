import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_dog_zizzi/services/token_service.dart';

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