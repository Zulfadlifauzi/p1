import 'dart:convert';

Fruit fruitFromJson(String str) => Fruit.fromJson(json.decode(str));

String fruitToJson(Fruit data) => json.encode(data.toJson());

class Fruit {
  Fruit({
    this.genus,
    this.name,
    this.id,
    this.family,
    this.order,
    this.nutritions,
  });

  String? genus;
  String? name;
  int? id;
  String? family;
  String? order;
  Nutritions? nutritions;

  factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        genus: json["genus"],
        name: json["name"],
        id: json["id"],
        family: json["family"],
        order: json["order"],
        nutritions: Nutritions.fromJson(json["nutritions"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "name": name,
        "id": id,
        "family": family,
        "order": order,
        "nutritions": nutritions!.toJson(),
      };
}

class Nutritions {
  Nutritions({
    this.carbohydrates,
    this.protein,
    this.fat,
    this.calories,
    this.sugar,
  });

  double? carbohydrates;
  double? protein;
  double? fat;
  int? calories;
  double? sugar;

  factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
        carbohydrates: json["carbohydrates"].toDouble(),
        protein: json["protein"].toDouble(),
        fat: json["fat"].toDouble(),
        calories: json["calories"],
        sugar: json["sugar"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "carbohydrates": carbohydrates,
        "protein": protein,
        "fat": fat,
        "calories": calories,
        "sugar": sugar,
      };
}
