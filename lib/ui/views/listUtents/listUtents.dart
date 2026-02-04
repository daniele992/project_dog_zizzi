import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/user/user_providers.dart';

class ListUsers extends ConsumerStatefulWidget {
  const ListUsers({super.key});

  @override
  ConsumerState<ListUsers> createState() => _ListUsers();
}

class _ListUsers extends ConsumerState<ListUsers> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userViewModelProvider.notifier).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(userViewModelProvider);

    return usersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Errore: $e')),
      data: (users) {
        if (users.isEmpty) {
          return const Center(child: Text('Nessun utente trovato'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: users.map((user) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.name} ${user.surname}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(user.email),
                        const SizedBox(height: 4),
                        Text('Admin: ${user.admin ? "Sì" : "No"}'),
                        const SizedBox(height: 4),
                        Text(
                          'Creato il: ${user.createdAt.toLocal().toString().split(" ")[0]}',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );



  }
}


/* @override
Widget build(BuildContext context) {

  final usersAsync = ref.watch(userViewModelProvider);

  return Scaffold(
    body: usersAsync.when(
      data: (users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, index){
          final user = users[index];
          return ListTile(
            title: Text('${user.name} ${user.surname}'),
            subtitle: Text(user.email),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e,_) => Center(child: Text(e.toString())),
    ),
  );
} */
