import 'package:flutter/material.dart';
import 'package:loka_app/models/recipe.dart';
import 'package:loka_app/pages/description/description_view.dart';
import 'package:loka_app/pages/home/home_controller.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/home';
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loka App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.getAllRecipes();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
      body: AnimatedBuilder(
        animation: homeController,
        builder: (context, _) {
          if (homeController.errorMessage != null) {
            return Center(child: Text(homeController.errorMessage!));
          }

          if (homeController.sortedRecipesList == null) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Recipe> sortedRecipesList = homeController.sortedRecipesList!;

          if (sortedRecipesList.isEmpty) {
            return const Center(child: Text('No recipes yet :('));
          }

          return ListView.builder(
            itemCount: sortedRecipesList.length,
            itemBuilder: (context, index) {
              Recipe recipe = sortedRecipesList[index];

              return InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                  DescriptionView.routeName,
                  arguments: DescriptionViewArguments(
                    recipe,
                  ),
                ),
                child: ListTile(
                  title: Text(recipe.name),
                  subtitle: Text(recipe.category ?? 'Unknown'),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
