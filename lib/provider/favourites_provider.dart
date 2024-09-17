import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  void toggleFavouriteMeals(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m != meal).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});
