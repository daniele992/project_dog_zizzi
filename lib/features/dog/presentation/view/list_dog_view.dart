import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/authRepository/user_provider.dart';
import '../../../../core/providers/dog/dog_providers.dart';

class ListDogs extends ConsumerStatefulWidget{
  const ListDogs({super.key});

  @override
  ConsumerState<ListDogs> createState() => _ListDogs();
}

class _ListDogs extends ConsumerState<ListDogs>{

  @override
  void initState(){
    super.initState();
    Future.microtask((){
      final isAdmin = ref.read(userIsAdminProvider).value;
      if(isAdmin != null){ //TODO modificare in seguito
        ref.read(dogListViewModelProvider.notifier).fetchDogs(userId: 1, isAdmin: true);
      }
    });
  }

  @override
  Widget build(BuildContext context){

    final isAdmin = ref.watch(userIsAdminProvider).value;
    final dogsState = ref.watch(dogListViewModelProvider);

    return Scaffold(
      body: dogsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Errore: $e")),
        data: (dogs) {
          return ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              final dog = dogs[index];
              return ListTile(
                title: Text(dog.name),
                subtitle: Text(dog.breed),
              );
            },
          );
        },
      ),
    );
  }
}