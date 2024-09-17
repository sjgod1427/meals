import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen(
      {super.key, required this.onSelectScreen, required this.currentFilters});

  final Map<Filter, bool> currentFilters;
  final Function(String) onSelectScreen;

  @override
  State<FilterScreen> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarian = widget.currentFilters[Filter.vegetarian]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      // Navigator.of(context).pop();
      //if (identifier == 'Meals') {
      // Navigator.of(context).push(
      // MaterialPageRoute(
      // builder: (ctx) => const TabsScreen(),
      //  ),
      // );
      // }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFree,
            Filter.lactoseFree: _lactoseFree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFree = isChecked;
                });
              },
              title: Text(
                'Gluten Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text('Only include gluten free meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 10)),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFree = isChecked;
                });
              },
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text('Only include Lactose Free',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 10)),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarian = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text('Only include vegetarian',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 10)),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (isChecked) {
                setState(() {
                  _vegan = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text('Only include vegan',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 10)),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
