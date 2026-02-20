import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/presentation/viewmodels/user/delete_user_state.dart';
import '../../../core/constants/text_strings.dart';
import '../../../domain/usecases/user/delete_user.dart';

class DeleteUserViewModel extends StateNotifier<DeleteUserState>{
  final DeleteUser deleteUser;

  DeleteUserViewModel(this.deleteUser) : super(const DeleteUserState());

  Future<void> delete(int id) async {
    state = state.copyWith(status: DeleteStatus.loading);

    try{
      await deleteUser(id);
      state = state.copyWith(status: DeleteStatus.success);
    } catch (e) {
      if(e.toString().contains("403")){
        state = state.copyWith(
          status: DeleteStatus.forbidden,
          message: tErrorNoPermissionDelete,
        );
      } else if (e.toString().contains("401")){
        state = state.copyWith(
          status: DeleteStatus.unauthorized,
          message: tErrorFinishSession,
        );
      } else {
        state = state.copyWith(
          status: DeleteStatus.error,
          message: tGeneralErrorDelete,
        );
      }
    }
  }

  void reset() {
    state = const DeleteUserState();
  }

}