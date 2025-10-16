import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/colors.dart';
import '../models/navigation_item.dart';
import '../services/theme_service.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Obx(
      () => Scaffold(
        backgroundColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            fillColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
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
              backgroundColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.textColor,
              curve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 400),
              gap: 4,
              color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.2) : LightColors.backgroundColor.withValues(alpha: 0.2),
              activeColor: themeService.darkTheme ? DarkColors.textColor : LightColors.backgroundColor,
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
        ),
      ),
    );
  }
}
