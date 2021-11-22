class Recipe {
  String? name;
  String? images;
  String? totaltime;
  double? rating;

  Recipe({this.images, this.name, this.rating, this.totaltime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totaltime: json['totalTime'] as String,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe{name:$name,image:$images,rating:$rating,totalTime:$totaltime}';
  }
}
