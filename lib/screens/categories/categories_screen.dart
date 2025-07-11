import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../services/categories_controller.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/header_widget.dart';
import '../results/results_screen.dart';
import 'widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spoonacularService = Get.find<SpoonacularService>();
    final themeService = Get.find<ThemeService>();
    final categoriesService = Get.find<CategoriesService>();

    return Scaffold(
      backgroundColor: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimatedColumn(
            children: [
              const SizedBox(height: 36),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: HeaderWidget(title: 'Search by category'),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: categoriesService.categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) {
                  final category = categoriesService.categories[index];

                  return CategoryWidget(
                    color: category.color,
                    icon: category.icon,
                    title: category.title,
                    onTap: () {
                      spoonacularService.searchRecipes(category.title.toLowerCase());
                      Get.to(ResultsScreen.new);
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
