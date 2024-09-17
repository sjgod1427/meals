import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final Function(String) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Expanded(
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 50),
                SizedBox(width: 14),
                Text(
                  'COOKING UP.....',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.8),
                      fontSize: 20),
                )
              ],
            ),
          ),
        ),
        ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            onTap: () {
              onSelectScreen('Meals');
            }),
        ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            onTap: () {
              onSelectScreen('Filters');
            }),
      ],
    ));
  }
}
