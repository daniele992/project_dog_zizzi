import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      ref.read(dogListViewModelProvider.notifier).fetchDogs(userId: 1, isAdmin: true);
    });
  }

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Text("Lista cani"),
    );
  }
}