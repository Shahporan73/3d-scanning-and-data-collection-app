import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resource/app_colors/App_Colors.dart';
import '../../../../resource/app_images/app_images.dart';
import '../../../../resource/utilitis/common_style.dart';

class AuthHeader extends StatelessWidget {
  final String? firstPart;
  final String? highlightPart;
  final String? lastPart;

  const AuthHeader({
    super.key,
    this.firstPart,
    this.highlightPart,
    this.lastPart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            AppImages.authLogo,
            width: Get.width / 2,
            height: Get.height / 4,
          ),
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              if (firstPart != null && firstPart!.isNotEmpty)
                TextSpan(
                  text: firstPart!,
                  style: CommonStyle.textStyleLarge(size: 22),
                ),
              if (highlightPart != null && highlightPart!.isNotEmpty)
                TextSpan(
                  text: highlightPart!,
                  style: CommonStyle.textStyleLarge(
                    size: 22,
                    color: AppColors.mainColor,
                  ),
                ),
              if (lastPart != null && lastPart!.isNotEmpty)
                TextSpan(
                  text: lastPart!,
                  style: CommonStyle.textStyleLarge(size: 22),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
