import 'package:flutter/material.dart';

import 'package:meals_app/meal.dart';
import 'package:meals_app/meal_item.dart';
import 'package:meals_app/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      this.title,
      required this.onToggleFavouriteStatus});

  final Function(Meal meal) onToggleFavouriteStatus;
  final String? title;
  final List<Meal> meals;

  void _onSelectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealDetailScreen(
              meal: meal,
              onToggleFavouriteStatus: onToggleFavouriteStatus,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectMeal: _onSelectMeal,
            ));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Uh oh....No meals found'),
            const SizedBox(height: 16),
            Text(
              'Try some other categorties',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
