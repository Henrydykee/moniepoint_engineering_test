import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/core/platform/color.dart';
import 'package:moniepoint_test/core/platform/icons_path.dart';


List<String> navIcons = [
  IconsPath.searchIcon,
  IconsPath.chatIcon,
  IconsPath.homeIcon,
  IconsPath.heartIcon,
  IconsPath.profileIcon,
];

class NavBarItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: isSelected ? TestColor.orangePeel : TestColor.eerieBlack,
        radius: 30,
        child: SvgPicture.asset(
          icon,
          height: 30,
          colorFilter:  const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}