// views/camera_view.dart
import 'package:data_collection_app/app/modules/camera/views/review_image_view.dart';
import 'package:data_collection_app/app/modules/camera/views/take_image_by_camera_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller only once
    Get.put(CameraController());

    return Scaffold(
      body: Obx(() {
        // Use GetX to reactively switch between views
        if (controller.isAllPicturesComplete.value == true) {
          return ReviewImageView();
        } else {
          return TakeImageByCameraView();
        }
      }),
    );
  }
}