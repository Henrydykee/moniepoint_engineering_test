import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/platform/color.dart';
import '../../../bookmark/presentation/pages/bookmark_screen.dart';
import '../../../chat/presentation/pages/chat_screen.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../search/presentation/pages/search_screen.dart';
import 'navigation_bar_item.dart';

class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({super.key});

  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  late int selectedIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    selectedIndex = 2;
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget navBar() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Container(
          height: 80,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: TestColor.charcoalBlack,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: navIcons.asMap().entries.map((entry) {
              final index = entry.key;
              final icon = entry.value;
              return NavBarItem(
                  icon: icon,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    _pageController.jumpToPage(index);
                    setState(() => selectedIndex = index);
                  });
            }).toList(),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SearchScreen(),
              ChatScreen(),
              HomeScreen(),
              BookmarkScreen(),
             ProfileScreen(),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: navBar())
        ],
      ),
    );
  }
}
