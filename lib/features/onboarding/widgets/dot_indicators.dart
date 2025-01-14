import 'package:flutter/material.dart';

import '../../../core/theming/colors.dart';


class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.inActiveColor,
    this.activeColor = Colors.white,
  });

  final bool isActive;

  final Color? inActiveColor, activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:const Duration(milliseconds: 300),
      height:isActive?12:8,
      width: isActive?12:8,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        color: isActive
            ? activeColor
            : inActiveColor ?? ColorsManager.gray,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
    );
  }
}