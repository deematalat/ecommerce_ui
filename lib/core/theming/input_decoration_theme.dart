import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';


 InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  fillColor:ColorsManager.lightGray,
  filled: true,
  hintStyle: TextStyle(color:ColorsManager.gray),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedUnderlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

 InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  fillColor: ColorsManager.gray,
  filled: true,
  hintStyle: TextStyle(color:Colors.white38),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedUnderlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

 UnderlineInputBorder outlineInputBorder =  UnderlineInputBorder(
   borderSide: const BorderSide(
     color: ColorsManager.mainRed,
     width: 1.3,
   ),
   borderRadius: BorderRadius.circular(16.0),
 );

 UnderlineInputBorder focusedUnderlineInputBorder =UnderlineInputBorder(
   borderSide: const BorderSide(
     color: ColorsManager.lighterGray,
     width: 1.3,
   ),
   borderRadius: BorderRadius.circular(16.0),
 );

 OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.h)),
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

OutlineInputBorder secodaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius:  BorderRadius.all(Radius.circular(25.h)),
    borderSide: BorderSide(
      color:ColorsManager.mainRed.withOpacity(0.15),
    ),
  );
}