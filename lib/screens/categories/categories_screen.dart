import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import 'categories_controller.dart';
import '../../services/spoonacular_service.dart';
import '../../services/theme_service.dart';
import '../../models/category.dart';
import '../../widgets/animated_column.dart';
import '../../widgets/header_widget.dart';
import '../results/results_screen.dart';
import 'widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories-screen';

  @override
  Widget build(BuildContext context) {
    final SpoonacularService _spoonacularController = Get.find<SpoonacularService>();
    final CategoriesController _categoryController = Get.put(CategoriesController());
    final ThemeService _themeController = Get.find<ThemeService>();

    return Scaffold(
      backgroundColor: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedColumn(
              children: <Widget>[
                const SizedBox(height: 36.0),
                const HeaderWidget(title: 'Search by category'),
                const SizedBox(height: 24.0),
                GridView.builder(
                  itemCount: _categoryController.categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final Category category = _categoryController.categories[index];

                    return CategoryWidget(
                      color: category.color,
                      icon: category.icon,
                      title: category.title,
                      onTap: () {
                        _spoonacularController.searchRecipes(category.title.toLowerCase());
                        Get.toNamed(ResultsScreen.routeName);
                      },
                    );
                  },
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
