import 'package:flutter/material.dart';
import 'package:loka_app/models/recipe.dart';
import 'package:loka_app/services/recipe_service.dart';

class HomeController extends ChangeNotifier {
  List<Recipe>? recipesList;
  String? errorMessage;

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
