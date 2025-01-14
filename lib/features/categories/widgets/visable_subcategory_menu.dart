import 'package:flutter/material.dart';

class VisableSubcategoryMenu extends StatelessWidget {
  const VisableSubcategoryMenu(
      {super.key,
      required this.isClicked,
      required this.category,
      required this.onTap});

  final bool isClicked;
  final Function() onTap;
  final Map<String, List<String>> category;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isClicked,
      child: Column(
        children: category.values.first.map((subcategory) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              onTap: onTap,
              title: Text(subcategory),
            ),
          );
        }).toList(),
      ),
    );
  }
}
