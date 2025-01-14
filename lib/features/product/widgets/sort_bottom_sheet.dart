import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class SortBottomSheet extends StatelessWidget {
  final List<String> sortOptions = [
    "Popularity",
    "New",
    "Discount",
    "price:High-Law",
    "Price:Law-High",
  ];
  final Function(String) onSortSelected;

  SortBottomSheet({super.key, required this.onSortSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.moreLighterGray,
      height: 350,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: Center(
              child: Text(
                "SORT BY",
                style: TextStyles.font24RedBold,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: sortOptions.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    onSortSelected(option);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
