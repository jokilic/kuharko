import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/shadows.dart';
import '../../../constants/text_styles.dart';
import '../../../services/theme_service.dart';
import '../../../widgets/animated_column.dart';
import '../../../widgets/kuharko_image.dart';

class RecipeResult extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final Function() onTap;
  final Color color;
  final Color clockColor;
  final int minutes;
  final bool isVegan;
  final bool isHealthy;
  final bool isCheap;
  final bool isPopular;

  const RecipeResult({
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
    required this.color,
    required this.clockColor,
    required this.minutes,
    required this.isVegan,
    required this.isHealthy,
    required this.isCheap,
    required this.isPopular,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: Shadows.myShadow,
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox.expand(
                      child: KuharkoImage(image),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: AnimatedColumn(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedColumn(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: MyTextStyles.resultTitle.copyWith(
                                color: color,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              description,
                              style: MyTextStyles.resultDescription.copyWith(
                                color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.8) : LightColors.textColor.withValues(alpha: 0.8),
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: clockColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    MyIcons.clock,
                                    color: LightColors.backgroundColor,
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '$minutes min',
                                    style: MyTextStyles.resultMinutes.copyWith(
                                      color: LightColors.backgroundColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Wrap(
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  if (isVegan)
                                    Image.asset(
                                      MyIcons.vegan,
                                      height: 22,
                                      width: 22,
                                    ),
                                  if (isHealthy)
                                    Image.asset(
                                      MyIcons.healthy,
                                      height: 22,
                                      width: 22,
                                    ),
                                  if (isCheap)
                                    Image.asset(
                                      MyIcons.cheap,
                                      height: 22,
                                      width: 22,
                                    ),
                                  if (isPopular)
                                    Image.asset(
                                      MyIcons.popular,
                                      height: 22,
                                      width: 22,
                                    ),
                                ],
                              ),
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
      ),
    );
  }
}
