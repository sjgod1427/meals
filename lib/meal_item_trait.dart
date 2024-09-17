import 'package:flutter/material.dart';

class MealItemDart extends StatelessWidget {
  const MealItemDart({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.white),
        )
      ],
    );
  }
}
