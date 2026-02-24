import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/category_post_model.dart';
import '../../../data/models/priority_post_model.dart';

/*
* Carica i dati JSON dal bundle
* Converte ogni oggetto in un categoryPostProvider
* Restituisce una lista List<CategoryPost>
* è un future provider quindi si può usare asyncValue.when(...)
* */

final categoryPostProvider = FutureProvider<List<CategoryPost>> ((ref) async {
  final jsonStr = await rootBundle.loadString('assets/json/categoryPost.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => CategoryPost.fromJson(e)).toList();
});

final priorityPostProvider = FutureProvider<List<PriorityPost>>((ref) async{
  final jsonStr = await rootBundle.loadString('assets/json/priorityPost.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => PriorityPost.fromJson(e)).toList();
});


final categorySelectedProvider = StateProvider<CategoryPost?>((ref) => null);
final prioritySelectedProvider = StateProvider<PriorityPost?>((ref) => null);