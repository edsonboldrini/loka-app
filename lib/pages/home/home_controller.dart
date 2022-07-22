import 'package:flutter/material.dart';
import 'package:loka_app/models/recipe.dart';
import 'package:loka_app/services/recipe_service.dart';

class HomeController extends ChangeNotifier {
  String? errorMessage;
  List<Recipe>? recipesList;
  List<Recipe>? get sortedRecipesList =>
      recipesList?..sort(((a, b) => b.name.compareTo(a.name)));

  getAllRecipes() async {
    try {
      errorMessage = null;
      recipesList = null;
      notifyListeners();

      await Future.delayed(const Duration(milliseconds: 1000));
      recipesList = await RecipeService.getAll();
    } catch (error) {
      errorMessage = error.toString();
    }

    notifyListeners();
  }
}
