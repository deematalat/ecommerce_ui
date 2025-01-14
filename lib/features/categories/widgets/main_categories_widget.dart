import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class MainCategoriesWidget extends StatefulWidget {
  const MainCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<MainCategoriesWidget> createState() => _MainCategoriesWidgetState();
}

class _MainCategoriesWidgetState extends State<MainCategoriesWidget> {
  final List<Category> _categoryData = [
    Category(
      imageUrl: "assets/images/man.png",
      color: ColorsManager.softYellow,
      categoryName: "Man",
    ),
    Category(
        imageUrl: "assets/images/woman.png",
        color: ColorsManager.yellow,
        categoryName: "Woman"),
    Category(
        imageUrl: "assets/images/kids.png",
        color: ColorsManager.babyBlue,
        categoryName: "Kids")
  ];

// i have removed the expanded and add the shrink wrap
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _categoryData.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryContent(
          category: _categoryData[index],
          onTap: () {
            context.pushNamed(Routes.categoryMenu,
                arguments: _categoryData[index].categoryName);
          },
          index: index,
        );
      },
    );
  }
}

class CategoryContent extends StatelessWidget {
  const CategoryContent({
    Key? key,
    required this.category,
    required this.onTap,
    required this.index,
  }) : super(key: key);
  final Category category;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // i have added expanded to this widget
      child: Container(
        height: 250.h,
        color: category.color,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.w),
          child: (index % 2 == 0)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      category.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      category.categoryName,
                      style: TextStyles.font26BlackBold,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category.categoryName,
                      style: TextStyles.font26BlackBold,
                    ),
                    Image.asset(
                      category.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class Category {
  final String imageUrl;
  final Color color;
  final String categoryName;

  Category(
      {required this.imageUrl,
      required this.color,
      required this.categoryName});
}
