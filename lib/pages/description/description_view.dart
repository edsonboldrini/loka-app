import 'package:flutter/material.dart';
import 'package:loka_app/models/recipe.dart';

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class DescriptionViewArguments {
  final Recipe recipe;

  DescriptionViewArguments(this.recipe);
}

class DescriptionView extends StatelessWidget {
  static const routeName = '/description';
  const DescriptionView({Key? key}) : super(key: key);

  getStringSection(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: '),
          Text(
            value ?? 'Unknown',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  getIngredientsSection(List<Ingredients> ingredients) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ingredients: '),
          ...ingredients
              .map((e) => Row(
                    children: [
                      Text(
                        e.ingredient ?? 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        e.amount != null && !e.amount!.isNaN
                            ? e.amount.toString()
                            : 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        e.unit ?? 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ))
              .toList()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DescriptionViewArguments args =
        ModalRoute.of(context)!.settings.arguments as DescriptionViewArguments;
    final Recipe recipe = args.recipe;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name + ' Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getStringSection('Name', recipe.name),
            getStringSection('Glass', recipe.glass),
            getStringSection('Category', recipe.category),
            getIngredientsSection(recipe.ingredients!),
            getStringSection('Preparation', recipe.preparation),
          ],
        ),
      ),
    );
  }
}
