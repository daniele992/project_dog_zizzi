import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowDialogAddPost extends ConsumerStatefulWidget {
  const ShowDialogAddPost({super.key});

  @override
  ConsumerState<ShowDialogAddPost> createState() => _ShowDialogAddPost();
}

class _ShowDialogAddPost extends ConsumerState<ShowDialogAddPost>{
  @override
  Widget build(BuildContext context){
    return const Text("Aceko");
  }

}