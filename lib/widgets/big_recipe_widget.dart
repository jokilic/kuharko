import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/images.dart';
import '../constants/text_styles.dart';
import '../controllers/theme_controller.dart';
import 'animated_column.dart';

class BigRecipeWidget extends StatelessWidget {
  final Function onTap;
  final String image;
  final String title;
  final String mealType;
  final int readyInMinutes;

  const BigRecipeWidget({
    @required this.onTap,
    @required this.image,
    @required this.title,
    @required this.mealType,
    @required this.readyInMinutes,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: Get.height * 0.45,
        width: Get.width * 0.65,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: image == null
                  ? Image.asset(
                      MyImages.foodPlaceholder,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    )
                  : Image.network(
                      image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
            ),
            Obx(
              () => Container(
                height: 120.0,
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AnimatedColumn(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: MyTextStyles.bigRecipeWidgetTitle.copyWith(
                                  color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                mealType,
                                style: MyTextStyles.bigRecipeWidgetSubtitle.copyWith(
                                  color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.4) : LightColors.textColor.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedColumn(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            MyIcons.alarm,
                            width: 42.0,
                            height: 42.0,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "$readyInMinutes'",
                            style: MyTextStyles.bigRecipeWidgetRating.copyWith(
                              color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
