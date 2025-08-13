import 'package:data_collection_app/app/modules/camera/views/review_image_view.dart';
import 'package:data_collection_app/app/modules/camera/views/take_image_by_camera_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/camera_controller.dart';
import '../widget/progress_indicator_widget.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({super.key});
  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = Get.put(CameraController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Helmet Picture Capture'),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade700, Colors.blue.shade100],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              Expanded(
                child: Obx(() {
                  if (cameraController.isAllPicturesComplete.value) {
                    return ReviewImageView();
                  } else {
                    return TakeImageByCameraView();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}