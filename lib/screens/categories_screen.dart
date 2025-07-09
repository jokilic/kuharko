import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../controllers/category_controller.dart';
import '../controllers/spoonacular_controller.dart';
import '../controllers/theme_controller.dart';
import '../models/category.dart';
import '../screens/results_screen.dart';
import '../widgets/animated_column.dart';
import '../widgets/categories_screen/category_widget.dart';
import '../widgets/header_widget.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories-screen';

  @override
  Widget build(BuildContext context) {
    final SpoonacularController _spoonacularController = Get.find<SpoonacularController>();
    final CategoryController _categoryController = Get.put(CategoryController());
    final ThemeController _themeController = Get.find<ThemeController>();

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
