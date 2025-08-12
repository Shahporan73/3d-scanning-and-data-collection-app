import 'package:data_collection_app/app/modules/authentication/views/signup_view.dart';
import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:data_collection_app/resource/app_images/app_images.dart';
import 'package:data_collection_app/resource/comon_widget/custom_text.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SlideActionState> _key = GlobalKey();

    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.onboarding,
              alignment: Alignment.center,
              colorBlendMode: BlendMode.multiply,
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),

          /// Bottom Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                      AppImages.atoForm,
                      alignment: Alignment.center,
                      width: Get.width / 1,
                      height: Get.height / 8,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "3D Head Scanning for Custom-Fit\nSafety Solutions",
                    textAlign: TextAlign.center,
                    style: CommonStyle.textStyleMedium(
                      size: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Swipe Button
                  SlideAction(
                    key: _key,
                    borderRadius: 30,
                    elevation: 0,
                    outerColor: Colors.white,
                    innerColor: AppColors.secondaryColor,
                    sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.white),
                    text: "Swipe to Get Started",
                    textStyle: const TextStyle(color: AppColors.secondaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                    onSubmit: () async {
                      controller.isLoading.value = true;
                      await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
                      controller.isLoading.value = false;
                      Get.to(()=>SignupView());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
