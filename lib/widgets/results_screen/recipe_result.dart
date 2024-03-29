import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/shadows.dart';
import '../../constants/text_styles.dart';
import '../../controllers/theme_controller.dart';
import '../animated_column.dart';

class RecipeResult extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Function onTap;
  final Color color;
  final Color clockColor;
  final int minutes;
  final bool isVegan;
  final bool isHealthy;
  final bool isCheap;
  final bool isPopular;

  const RecipeResult({
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.onTap,
    @required this.color,
    @required this.clockColor,
    @required this.minutes,
    @required this.isVegan,
    @required this.isHealthy,
    @required this.isCheap,
    @required this.isPopular,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();

    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: Shadows.myShadow,
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 130.0,
                width: 110.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedColumn(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: MyTextStyles.resultTitle.copyWith(
                              color: color,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            description,
                            style: MyTextStyles.resultDescription.copyWith(
                              color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.8) : LightColors.textColor.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: clockColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  MyIcons.clock,
                                  color: LightColors.backgroundColor,
                                  height: 16.0,
                                  width: 16.0,
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  '$minutes min',
                                  style: MyTextStyles.resultMinutes.copyWith(
                                    color: LightColors.backgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              if (isVegan)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Image.asset(
                                    MyIcons.vegan,
                                    height: 22.0,
                                    width: 22.0,
                                  ),
                                ),
                              if (isHealthy)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Image.asset(
                                    MyIcons.healthy,
                                    height: 22.0,
                                    width: 22.0,
                                  ),
                                ),
                              if (isCheap)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Image.asset(
                                    MyIcons.cheap,
                                    height: 22.0,
                                    width: 22.0,
                                  ),
                                ),
                              if (isPopular)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Image.asset(
                                    MyIcons.popular,
                                    height: 22.0,
                                    width: 22.0,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
