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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(
      ThemeController(),
      permanent: true,
    );

    return Obx(
      () => Scaffold(
          backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              fillColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              child: child,
            ),
            child: NavigationItem.items[currentIndex].page,
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              child: GNav(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.textColor,
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 400),
                gap: 4,
                color: themeController.darkTheme ? DarkColors.textColor.withOpacity(0.2) : LightColors.backgroundColor.withOpacity(0.2),
                activeColor: themeController.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
                selectedIndex: currentIndex,
                onTabChange: (index) => setState(() => currentIndex = index),
                tabs: [
                  for (int index = 0; index < NavigationItem.items.length; index++)
                    GButton(
                      icon: Icons.check,
                      leading: currentIndex == index ? NavigationItem.items[index].iconActive : NavigationItem.items[index].icon,
                      text: NavigationItem.items[index].title,
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
