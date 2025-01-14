import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../features/pages/widgets/divider_list_tile.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    required this.text,
    this.svgSrc,
    required this.press,
    this.isShowDivider = true,
  });

  final String text;
  final String? svgSrc;
  final VoidCallback press;
  final bool isShowDivider;

  @override
  Widget build(BuildContext context) {
    return DividerListTile(
      minLeadingWidth: (svgSrc != null) ? 24 : 0,
      leading: (svgSrc != null)
          ? SvgPicture.asset(
              svgSrc!,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                ColorsManager.mainRed,
                BlendMode.srcIn,
              ),
            )
          : SizedBox(),
      title: Text(
        text,
        style: TextStyles.font30BlackRegular,
      ),
      press: press,
      isShowDivider: isShowDivider,
    );
  }
}
