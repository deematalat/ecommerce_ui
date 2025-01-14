import 'package:flutter_svg/flutter_svg.dart';



class Menu {
  final String title;
  final SvgPicture svg;

  Menu({required this.svg, required this.title});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
 svg: SvgPicture.asset(""),
  ),
  Menu(
    title: "Profile",
    svg: SvgPicture.asset(""),
  ),

  Menu(
    title: "Favorites",
    svg: SvgPicture.asset(""),
  ),
  Menu(
    title: "Delivery",
    svg: SvgPicture.asset(""),
  ),
  Menu(
    title: "Settings",
    svg: SvgPicture.asset(""),
  ),
];
List<Menu> sidebarMenus2 = [
  Menu(
    title: "History",
    svg: SvgPicture.asset(""),
  ),
  Menu(
    title: "Notifications",
    svg: SvgPicture.asset(""),
  ),
];