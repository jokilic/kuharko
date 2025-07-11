import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../services/theme_service.dart';

class KuharkoImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;

  const KuharkoImage(
    this.imageUrl, {
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        height: height,
        width: width,
        fit: fit,
        placeholder: (_, __) => Animate(
          onPlay: (controller) => controller.loop(
            reverse: true,
            min: 0.6,
          ),
          effects: const [
            FadeEffect(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 1500),
            ),
          ],
          child: Container(
            color: themeService.darkTheme ? DarkColors.textColor.withValues(alpha: 0.1) : LightColors.textColor.withValues(alpha: 0.1),
            height: height,
            width: width,
          ),
        ),
        errorWidget: (_, __, error) => Image.asset(
          MyImages.foodPlaceholder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }

    return Image.asset(
      MyImages.foodPlaceholder,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
