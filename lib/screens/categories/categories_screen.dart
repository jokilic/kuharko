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
  static const String routeName = '/categories-screen';

  @override
  Widget build(BuildContext context) {
    final spoonacularController = Get.find<SpoonacularService>();
    final categoriesController = Get.put(CategoriesController());
    final themeController = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: AnimatedColumn(
              children: [
                SizedBox(height: 36),
                HeaderWidget(title: 'Search by category'),
                SizedBox(height: 24),
                GridView.builder(
                  itemCount: categoriesController.categories.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        Get.toNamed(ResultsScreen.routeName);
                      },
                    );
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
