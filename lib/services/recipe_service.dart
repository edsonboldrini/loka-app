import 'dart:convert';

import 'package:http/http.dart';
import 'package:loka_app/models/recipe.dart';
import 'package:loka_app/services/main_service.dart';

class RecipeService {
  static Future<List<Recipe>> getAll() async {
    Response response = await MainService.httpGet(
        'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json');

    if (response.statusCode != 200) {
      throw Exception(json.decode(response.body)['message']);
    }

    var body = json.decode(response.body) as List;

    List<Recipe> recipes = body.map((e) => Recipe.fromMap(e)).toList();

    return recipes;
  }
}
