class CategoryPost {
  final int id;
  final String name;
  final String description;
  final String abbreviation;

  CategoryPost({
    required this.id,
    required this.name,
    required this.description,
    required this.abbreviation
  });

  //Factory restituisce un oggetto o una sottoclasse esistente e non restituisce necessariamente un'istanza
  factory CategoryPost.fromJson(Map<String, dynamic> json) {
    return CategoryPost(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      abbreviation: json['abbreviation'],
    );
  }
}