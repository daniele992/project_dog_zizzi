import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../data/datasources/remote/login_remote_datasource.dart';
import '../../../data/repositories/login_repository_impl.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../ui/viewmodels/authentication/signIn_view_model.dart';


final httpClientProvider = Provider((ref) => http.Client());

final loginRemoteDataSourceProvider = Provider(
      (ref) => LoginRemoteDataSource(ref.read(httpClientProvider)),
);

final loginRepositoryProvider = Provider(
      (ref) => LoginRepositoryImpl(ref.read(loginRemoteDataSourceProvider)),
);

final loginUserProvider = Provider(
      (ref) => LoginUser(ref.read(loginRepositoryProvider)),
);

final loginViewModelProvider =
StateNotifierProvider<LoginViewModel, AsyncValue<bool>>(
      (ref) => LoginViewModel(ref.read(loginUserProvider)),
);