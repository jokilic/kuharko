import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/text_styles.dart';
import '../../../services/theme_service.dart';
import '../../../widgets/animated_column.dart';
import '../../../widgets/animated_list_view.dart';

class SearchDialog extends StatelessWidget {
  final String title;
  final String image;
  final String hintText;
  final String hintIcon;
  final List<String> chosenControllerList;
  final TextEditingController chosenTextController;
  final Function(String) setJoinedValues;

  const SearchDialog({
    required this.title,
    required this.image,
    required this.setJoinedValues,
    required this.hintText,
    required this.hintIcon,
    required this.chosenControllerList,
    required this.chosenTextController,
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
                          image,
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
                    TextField(
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          chosenControllerList.add(value.trim());
                          chosenTextController.clear();
                          final joinedValues = chosenControllerList.join(', ');
                          setJoinedValues(joinedValues);
                        }
                      },
                      controller: chosenTextController,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorColor: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            hintIcon,
                            width: 30,
                            color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.8) : LightColors.textColor.withValues(alpha: 0.8),
                          ),
                        ),
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.4) : LightColors.textColor.withValues(alpha: 0.4),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        filled: false,
                        fillColor: themeService.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => ListView.separated(
                        itemCount: chosenControllerList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) => AnimatedListView(
                          index: index,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      chosenControllerList[index],
                                      style: MyTextStyles.searchDialogText.copyWith(
                                        color: themeService.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                GestureDetector(
                                  onTap: () {
                                    chosenControllerList.removeAt(index);
                                    final joinedValues = chosenControllerList.join(', ');
                                    setJoinedValues(joinedValues);
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Image.asset(
                                    MyIcons.delete,
                                    height: 44,
                                    width: 44,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                      ),
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
