import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/category.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/meals.dart';
import 'package:meals_app/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavourite,
      required this.availableMeals});

  final Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredCategory = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredCategory,
            onToggleFavouriteStatus: onToggleFavourite)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Your Choice'),
      ),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            //availableCategories.map((category)=>CategoryItem(category: category)).toList();
            for (final category in availableCategories)
              CategoryItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ]),
    );
  }
}
