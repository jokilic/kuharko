import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/text_styles.dart';

class CheckboxDialog extends StatelessWidget {
  final String title;
  final String icon;
  final List<String> chosenEnums;
  final List<String> chosenControllerList;
  final Function setJoinedValues;
  final bool multiValue;

  CheckboxDialog({
    @required this.title,
    @required this.icon,
    @required this.chosenEnums,
    @required this.chosenControllerList,
    @required this.setJoinedValues,
    this.multiValue = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: MyColors.bodyColor,
              ),
              height: Get.height * 0.5,
              width: Get.width * 0.8,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          icon,
                          height: 56.0,
                          width: 56.0,
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            title,
                            style: MyTextStyles.searchDialogHeadingText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.0),
                    ListView.builder(
                      itemCount: chosenEnums.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final String value = chosenEnums[index];

                        return GestureDetector(
                          onTap: () {
                            final bool isChecked =
                                chosenControllerList.contains(value);
                            if (multiValue) {
                              if (isChecked) {
                                chosenControllerList.remove(value);
                              } else {
                                chosenControllerList.add(value);
                              }
                              final String joinedValues =
                                  chosenControllerList.join(', ');
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
                          behavior: HitTestBehavior.opaque,
                          child: Obx(
                            () => Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value,
                                    style:
                                        MyTextStyles.searchDialogText.copyWith(
                                      fontWeight:
                                          chosenControllerList.contains(value)
                                              ? FontWeight.w800
                                              : FontWeight.w500,
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
                behavior: HitTestBehavior.opaque,
                onTap: Get.back,
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