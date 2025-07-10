import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/colors.dart';
import '../controllers/theme_controller.dart';
import '../models/navigation_item.dart';

class BottomNavigation extends StatefulWidget {
  static const String routeName = '/bottom-navigation';

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.put<ThemeController>(
      ThemeController(),
      permanent: true,
    );

    return Obx(
      () => Scaffold(
          backgroundColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              fillColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              child: child,
            ),
            child: NavigationItem.items[_currentIndex].page,
          ),
          bottomNavigationBar: SizedBox(
            height: 80.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16.0),
                topLeft: Radius.circular(16.0),
              ),
              child: GNav(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                backgroundColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.textColor,
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 400),
                gap: 4,
                color: _themeController.darkTheme
                    ? DarkColors.textColor.withOpacity(0.2)
                    : LightColors.backgroundColor.withOpacity(0.2),
                activeColor: _themeController.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
                selectedIndex: _currentIndex,
                onTabChange: (int index) => setState(() => _currentIndex = index),
                tabs: [
                  for (int index = 0; index < NavigationItem.items.length; index++)
                    GButton(
                      icon: Icons.check,
                      leading: _currentIndex == index
                          ? NavigationItem.items[index].iconActive
                          : NavigationItem.items[index].icon,
                      text: NavigationItem.items[index].title,
                    ),
                ],
              ),
            ),
          )

          //  SizedBox(
          //   height: 80.0,
          //   child: ClipRRect(
          //     borderRadius: const BorderRadius.only(
          //       topRight: Radius.circular(16.0),
          //       topLeft: Radius.circular(16.0),
          //     ),
          //     child: Obx(
          //       () => BottomNavigationBar(
          //         type: BottomNavigationBarType.fixed,
          //         backgroundColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.textColor,
          //         selectedItemColor: _themeController.darkTheme ? DarkColors.orangeColor : LightColors.orangeColor,
          //         unselectedItemColor: _themeController.darkTheme ? DarkColors.purpleColor : LightColors.purpleColor,
          //         showSelectedLabels: false,
          //         showUnselectedLabels: false,
          //         currentIndex: _currentIndex,
          //         onTap: (int index) => setState(() => _currentIndex = index),
          //         items: <BottomNavigationBarItem>[
          //           for (int index = 0; index < NavigationItem.items.length; index++)
          //             BottomNavigationBarItem(
          //               icon: _currentIndex == index
          //                   ? NavigationItem.items[index].iconActive
          //                   : NavigationItem.items[index].icon,
          //               label: NavigationItem.items[index].title,
          //             ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
