import 'package:flutter/material.dart';
import 'package:meals_app/meal.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen(
      {super.key, required this.meal, required this.onToggleFavouriteStatus});

  final Function(Meal meal) onToggleFavouriteStatus;

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {
                  onToggleFavouriteStatus(meal);
                },
              )
            ],
            title: Text(
              meal.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
            for (final ingredient in meal.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            const SizedBox(height: 14),
            Text('Steps',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold)),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
              ),
          ]),
        ));
  }
}
