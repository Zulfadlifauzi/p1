// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project1/models/recipe.dart';
import 'package:project1/models/recipe_api.dart';
import 'package:project1/widgets/recipe_card.dart';

class YummlyScreen extends StatefulWidget {
  const YummlyScreen({Key? key}) : super(key: key);

  @override
  _YummlyScreenState createState() => _YummlyScreenState();
}

class _YummlyScreenState extends State<YummlyScreen> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeAPI.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Restaurant Menu')
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  title: _recipes[index].name,
                  cookTime: _recipes[index].totaltime,
                  rating: _recipes[index].rating.toString(),
                  thumbnailUrl: _recipes[index].images,
                );
              }),
    );
  }
}
