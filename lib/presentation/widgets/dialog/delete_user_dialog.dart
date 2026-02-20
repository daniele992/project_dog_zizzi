import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/user/user_providers.dart';
import 'package:project_dog_zizzi/presentation/viewmodels/user/delete_user_state.dart';
import '../../../core/constants/text_strings.dart';
import '../../../data/models/listUsers_model.dart';

void showDeleteUser(BuildContext context, WidgetRef ref, UserModel user) {
  showDialog(
    context: context,
    builder: (_) {
      return Consumer(builder: (context, ref, _) {
        final state = ref.watch(deleteUserViewModelProvider);
        ref.listen(deleteUserViewModelProvider, (previous, next) {
          if (next.status == DeleteStatus.success) {
            Navigator.of(context).pop();
            ref.read(userViewModelProvider.notifier).fetchUsers(); //Refresh della lista
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Utente eliminato con successo"),
                backgroundColor: Colors.green,
              ),
            );
            ref.read(deleteUserViewModelProvider.notifier).reset();
          }

          if (next.status == DeleteStatus.forbidden ||
              next.status == DeleteStatus.error ||
              next.status == DeleteStatus.unauthorized) {
            Navigator.of(context).pop();

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(next.message ?? "Errore"),
              backgroundColor: Colors.red,
            ));
            ref.read(deleteUserViewModelProvider.notifier).reset();
          }
        });

        return AlertDialog(
          title: const Text(
            tConfirmDeletion,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: Text(
            "Sei sicuro di voler eliminare ${user.name} ${user.surname}?",
          ),
          actions: [
            ElevatedButton(
              onPressed: state.status == DeleteStatus.loading
                  ? null
                  : () {
                      ref.read(deleteUserViewModelProvider.notifier).delete(user.id);
                    },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: state.status == DeleteStatus.loading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text("Si"),
            ),
          ],
        );
      });
    },
  );
}
