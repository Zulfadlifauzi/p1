import 'dart:convert';

import 'package:project1/models/recipe.dart';

import 'package:http/http.dart' as http;

class RecipeAPI {
  static Future<List<Recipe>> getRecipe() async {
    var url = Uri.http('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(url, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "ff4c448e6amsh76b2737698e778ep1f4266jsn7d03e4a67f4e",
      "useQueryString": 'true'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
