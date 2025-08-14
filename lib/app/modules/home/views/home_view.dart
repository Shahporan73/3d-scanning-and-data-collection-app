import 'package:data_collection_app/app/modules/camera/views/camera_view.dart';
import 'package:data_collection_app/app/modules/how_to_use_scan/widget/custom_header.dart';
import 'package:data_collection_app/resource/app_images/app_images.dart';
import 'package:data_collection_app/resource/comon_widget/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/app_colors/App_Colors.dart';
import '../../../../resource/utilitis/common_style.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomHeader(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  AppImages.homeScanImage,
                  width: double.infinity,
                  height: Get.height / 2.2,
                ),
                const SizedBox(height: 0),
                Text(
                  'Welcome to your custom-fit era — powered by mobile 3D scanning.',
                  style: CommonStyle.textStyleLarge(
                    size: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  title: 'Start Scan Now',
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Start Scan Now',
                        style: CommonStyle.textStyleMedium(
                          size: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(AppImages.btnScanIcon, width: 30, height: 30,),
                    ],
                  ),
                  onTap: () {
                    Get.to(()=>CameraView());
                },)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
