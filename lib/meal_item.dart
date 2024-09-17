import 'package:flutter/material.dart';

import 'package:meals_app/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Function(Meal, BuildContext) onSelectMeal;

  String get complexity_ {
    final String complexity;
    return complexity = meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordability {
    final String affordability;
    return affordability = meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        onSelectMeal(meal, context);
      },
      child: Stack(
        children: [
          FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl)),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MealItemDart(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(width: 20),
                        MealItemDart(icon: Icons.work, label: '$complexity_'),
                        const SizedBox(width: 20),
                        MealItemDart(
                            icon: Icons.attach_money, label: '$affordability'),
                        const SizedBox(width: 20)
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
