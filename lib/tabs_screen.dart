import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/drawer.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/filters.dart';
import 'package:meals_app/meals.dart';
import 'package:meals_app/meal.dart';
import 'package:meals_app/provider/meals_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.vegetarian: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState {
  int selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2),
    ));
  }

  final List<Meal> _favouriteMeals = [];

  void _toggleMealFavouriteStatus(Meal meal) {
    final isFavourite = _favouriteMeals.contains(meal);

    if (isFavourite) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showMessage("Meal is No longer Favourite");
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showMessage("Meal is Now Favourite");
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _onSelectScreen(String title) async {
    Navigator.of(context).pop();
    if (title == 'Filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(
            currentFilters: _selectedFilters,
            onSelectScreen: _onSelectScreen,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    var activeTitle = "Categories";
    Widget activeScreen = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeals,
    );

    if (selectedPageIndex == 1) {
      activeScreen = MealsScreen(
          meals: _favouriteMeals,
          onToggleFavouriteStatus: _toggleMealFavouriteStatus);
      activeTitle = "Your Favourites";
    }

    return Scaffold(
      body: activeScreen,
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _onSelectScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
        ],
      ),
    );
  }
}
