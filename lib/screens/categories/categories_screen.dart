import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/header_widget.dart';
import '../results/results_screen.dart';
import 'categories_controller.dart';
import 'widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.find<SpoonacularService>();
    final categoriesController = Get.find<CategoriesController>();
    final themeController = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedColumn(
              children: [
                const SizedBox(height: 36),
                const HeaderWidget(title: 'Search by category'),
                const SizedBox(height: 24),
                GridView.builder(
                  itemCount: categoriesController.categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (_, index) {
                    final category = categoriesController.categories[index];

                    return CategoryWidget(
                      color: category.color,
                      icon: category.icon,
                      title: category.title,
                      onTap: () {
                        spoonacularController.searchRecipes(category.title.toLowerCase());
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
      ),
    );
  }
}
