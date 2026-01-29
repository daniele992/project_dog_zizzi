import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListUsers extends ConsumerStatefulWidget {
  const ListUsers({super.key});

  @override
  ConsumerState<ListUsers> createState() => _ListUsers();
}

class _ListUsers extends ConsumerState<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("ListaUtenti"),
    );
  }
}
