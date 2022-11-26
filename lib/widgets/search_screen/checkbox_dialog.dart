import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/text_styles.dart';
import '../../controllers/theme_controller.dart';
import '../animated_column.dart';
import '../animated_list_view.dart';

class CheckboxDialog extends StatelessWidget {
  final String title;
  final String icon;
  final List<String> chosenEnums;
  final List<String> chosenControllerList;
  final Function(String) setJoinedValues;
  final bool multiValue;

  const CheckboxDialog({
    @required this.title,
    @required this.icon,
    @required this.chosenEnums,
    @required this.chosenControllerList,
    @required this.setJoinedValues,
    this.multiValue = true,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: _themeController.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor,
              ),
              height: Get.height * 0.6,
              width: Get.width * 0.8,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: AnimatedColumn(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          icon,
                          height: 56.0,
                          width: 56.0,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Obx(
                            () => Text(
                              title,
                              style: MyTextStyles.searchDialogHeadingText.copyWith(
                                color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36.0),
                    ListView.builder(
                      itemCount: chosenEnums.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        chosenEnums.sort();
                        final String value = chosenEnums[index];

                        return AnimatedListView(
                          index: index,
                          child: GestureDetector(
                            onTap: () {
                              final bool isChecked = chosenControllerList.contains(value);
                              if (multiValue) {
                                if (isChecked) {
                                  chosenControllerList.remove(value);
                                } else {
                                  chosenControllerList.add(value);
                                }
                                final String joinedValues = chosenControllerList.join(', ');
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
                                margin: const EdgeInsets.only(bottom: 8.0),
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Obx(
                                      () => Text(
                                        value,
                                        style: MyTextStyles.searchDialogText.copyWith(
                                          color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                          fontWeight: chosenControllerList.contains(value) ? FontWeight.w800 : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    if (chosenControllerList.contains(value))
                                      Image.asset(
                                        MyIcons.spatula,
                                        height: 26.0,
                                        width: 26.0,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
                  height: 60.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
