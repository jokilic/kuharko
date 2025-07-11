import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/text_styles.dart';
import '../../../services/theme_service.dart';
import '../../../widgets/animated_column.dart';
import '../../../widgets/animated_list_view.dart';

class CheckboxDialog extends StatelessWidget {
  final String title;
  final String icon;
  final List<String> chosenEnums;
  final List<String> chosenControllerList;
  final Function(String) setJoinedValues;
  final bool multiValue;

  const CheckboxDialog({
    required this.title,
    required this.icon,
    required this.chosenEnums,
    required this.chosenControllerList,
    required this.setJoinedValues,
    this.multiValue = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: themeService.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              ),
              height: Get.height * 0.6,
              width: Get.width * 0.8,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: AnimatedColumn(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icon,
                          height: 56,
                          width: 56,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Obx(
                            () => Text(
                              title,
                              style: MyTextStyles.searchDialogHeadingText.copyWith(
                                color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    ListView.separated(
                      itemCount: chosenEnums.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        chosenEnums.sort();
                        final value = chosenEnums[index];

                        return AnimatedListView(
                          index: index,
                          child: GestureDetector(
                            onTap: () {
                              final isChecked = chosenControllerList.contains(value);

                              if (multiValue) {
                                if (isChecked) {
                                  chosenControllerList.remove(value);
                                } else {
                                  chosenControllerList.add(value);
                                }

                                final joinedValues = chosenControllerList.join(', ');
                                setJoinedValues(joinedValues);
                              } else {
                                chosenControllerList.clear();
                                if (!isChecked) {
                                  chosenControllerList.add(value);
                                  setJoinedValues(value);
                                } else {
                                  setJoinedValues('');
                                }
                                Get.back();
                              }
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => Text(
                                        value,
                                        style: MyTextStyles.searchDialogText.copyWith(
                                          color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                          fontWeight: chosenControllerList.contains(value) ? FontWeight.w800 : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    if (chosenControllerList.contains(value))
                                      Image.asset(
                                        MyIcons.spatula,
                                        height: 26,
                                        width: 26,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -24,
              right: -24,
              child: GestureDetector(
                onTap: Get.back,
                behavior: HitTestBehavior.translucent,
                child: Image.asset(
                  MyIcons.delete,
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
