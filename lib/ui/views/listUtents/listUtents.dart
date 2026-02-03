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
  void initState(){
    super.initState();
    Future.microtask((){
      //Tutti gli utenti, nessun filtro
      ref.read(userViewModelProvider.notifier).fetchUsers(isAdmin: null);
    });
  }

  @override
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
  }
}
