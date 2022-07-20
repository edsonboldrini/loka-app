import 'dart:convert';

import 'package:flutter/foundation.dart';

class Recipe {
  String name;
  String? glass;
  String? category;
  List<Ingredients>? ingredients;
  String? garnish;
  String? preparation;

  Recipe({
    this.name = '',
    this.glass,
    this.category,
    this.ingredients,
    this.garnish,
    this.preparation,
  });
  Recipe copyWith({
    String? name,
    String? glass,
    String? category,
    List<Ingredients>? ingredients,
    String? garnish,
    String? preparation,
  }) {
    return Recipe(
      name: name ?? this.name,
      glass: glass ?? this.glass,
      category: category ?? this.category,
      ingredients: ingredients ?? this.ingredients,
      garnish: garnish ?? this.garnish,
      preparation: preparation ?? this.preparation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'glass': glass,
      'category': category,
      'ingredients': ingredients?.map((x) => x.toMap()).toList(),
      'garnish': garnish,
      'preparation': preparation,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'],
      glass: map['glass'],
      category: map['category'],
      ingredients: List<Ingredients>.from(
          map['ingredients']?.map((x) => Ingredients.fromMap(x))),
      garnish: map['garnish'],
      preparation: map['preparation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Recipe(name: $name, glass: $glass, category: $category, ingredients: $ingredients, garnish: $garnish, preparation: $preparation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recipe &&
        other.name == name &&
        other.glass == glass &&
        other.category == category &&
        listEquals(other.ingredients, ingredients) &&
        other.garnish == garnish &&
        other.preparation == preparation;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        glass.hashCode ^
        category.hashCode ^
        ingredients.hashCode ^
        garnish.hashCode ^
        preparation.hashCode;
  }
}

class Ingredients {
  String? unit;
  double? amount;
  String? ingredient;

  Ingredients({
    this.unit,
    this.amount,
    this.ingredient,
  });

  Ingredients copyWith({
    String? unit,
    double? amount,
    String? ingredient,
  }) {
    return Ingredients(
      unit: unit ?? this.unit,
      amount: amount ?? this.amount,
      ingredient: ingredient ?? this.ingredient,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'unit': unit,
      'amount': amount,
      'ingredient': ingredient,
    };
  }

  factory Ingredients.fromMap(Map<String, dynamic> map) {
    var amount =
        map['amount'] is double ? map['amount'] : map['amount']?.toDouble();

    return Ingredients(
      unit: map['unit'],
      amount: amount,
      ingredient: map['ingredient'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredients.fromJson(String source) =>
      Ingredients.fromMap(json.decode(source));

  @override
  String toString() =>
      'Ingredients(unit: $unit, amount: $amount, ingredient: $ingredient)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ingredients &&
        other.unit == unit &&
        other.amount == amount &&
        other.ingredient == ingredient;
  }

  @override
  int get hashCode => unit.hashCode ^ amount.hashCode ^ ingredient.hashCode;
}
