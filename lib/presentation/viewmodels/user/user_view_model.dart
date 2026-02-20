import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/domain/usecases/user/get_users.dart';
import '../../../data/models/listUsers_model.dart';

class UserViewModel extends StateNotifier<AsyncValue<List<UserModel>>>{
  final GetUsers getUsers;


  UserViewModel(this.getUsers): super(const AsyncValue.loading());

  //fetch utenti
  Future<void> fetchUsers({bool? isAdmin}) async {
    try {
      state = const AsyncValue.loading();
      final users = await getUsers(isAdmin: isAdmin);
      state = AsyncValue.data(users);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }



}