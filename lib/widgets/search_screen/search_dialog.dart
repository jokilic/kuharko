import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/text_styles.dart';
import '../../controllers/theme_controller.dart';
import '../animated_column.dart';
import '../animated_list_view.dart';

class SearchDialog extends StatelessWidget {
  final String title;
  final String image;
  final String hintText;
  final String hintIcon;
  final List<String> chosenControllerList;
  final TextEditingController chosenTextController;
  final Function(String) setJoinedValues;

  const SearchDialog({
    @required this.title,
    @required this.image,
    @required this.setJoinedValues,
    @required this.hintText,
    @required this.hintIcon,
    @required this.chosenControllerList,
    @required this.chosenTextController,
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
                          image,
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
                    TextField(
                      onSubmitted: (String value) {
                        if (value.isNotEmpty) {
                          chosenControllerList.add(value.trim());
                          chosenTextController.clear();
                          final String joinedValues = chosenControllerList.join(', ');
                          setJoinedValues(joinedValues);
                        }
                      },
                      controller: chosenTextController,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorColor: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            hintIcon,
                            width: 30.0,
                            color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.8) : LightColors.textColor.withOpacity(0.8),
                          ),
                        ),
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: _themeController.darkTheme ? DarkColors.textColor.withOpacity(0.4) : LightColors.textColor.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: false,
                        fillColor: _themeController.darkTheme ? DarkColors.backgroundColor : LightColors.backgroundColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Obx(
                      () => ListView.builder(
                        itemCount: chosenControllerList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => AnimatedListView(
                          index: index,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      chosenControllerList[index],
                                      style: MyTextStyles.searchDialogText.copyWith(
                                        color: _themeController.darkTheme ? DarkColors.textColor : LightColors.textColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                GestureDetector(
                                  onTap: () {
                                    chosenControllerList.removeAt(index);
                                    final String joinedValues = chosenControllerList.join(', ');
                                    setJoinedValues(joinedValues);
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Image.asset(
                                    MyIcons.delete,
                                    height: 44.0,
                                    width: 44.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
