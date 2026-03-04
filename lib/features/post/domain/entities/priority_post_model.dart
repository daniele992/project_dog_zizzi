import 'package:flutter/foundation.dart';

class PriorityPost {
  final int id;
  final String name;
  final String description;
  final String abbreviation;
  final String color;

  PriorityPost({
    required this.id,
    required this.name,
    required this.description,
    required this.abbreviation,
    required this.color
  });

  //Factory restituisce un oggetto o una sottoclasse esistente e non restituisce necessariamente un'istanza
  factory PriorityPost.fromJson(Map<String, dynamic> json) {
    return PriorityPost(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      abbreviation: json['abbreviation'],
      color: json['color'],
    );
  }
}