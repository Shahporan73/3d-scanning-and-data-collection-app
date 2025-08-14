// views/take_image_by_camera_view.dart
import 'package:data_collection_app/app/modules/camera/model/picture_side.dart';
import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/camera_controller.dart';
import '../widget/camera_preview_widget.dart';
import 'face_scan_overlay_view.dart';

class TakeImageByCameraView extends GetView {
  const TakeImageByCameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = Get.put(CameraController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full Screen Camera Preview
          Positioned.fill(
            child: Obx(() {
              if (!cameraController.isCameraInitialized.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.white),
                      SizedBox(height: 16),
                      Text('Initializing camera...',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                );
              }
              return CameraPreviewWidget();
            }),
          ),

          // Face Scanning Overlay
          Positioned.fill(
            child: FaceScanningOverlay(),
          ),

          // Top Instruction Banner
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 5,
            right: 5,
            child: Obx(() => Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _getSideColor(cameraController.currentSide.value),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Capture ${cameraController.currentSide.value.displayName.toUpperCase()} VIEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    cameraController.currentSide.value.instruction,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )),
          ),

          // Progress Indicator at Top Right
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            right: 20,
            child: Obx(() => Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${cameraController.capturedImages.length}/4',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ),

          // Current Side Indicator (Left Side)
          Positioned(
            top: MediaQuery.of(context).padding.top + 100,
            left: 20,
            child: Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _getSideColor(cameraController.currentSide.value),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                cameraController.currentSide.value.displayName.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ),

          // Side Progress Indicators (Right Side)
          Positioned(
            right: 20,
            top: MediaQuery.of(context).padding.top + 100,
            child: Column(
              children: PictureSide.values.map((side) {
                return Obx(() {
                  final isCaptured = cameraController.capturedImages.any((img) => img.side == side);
                  final isCurrent = side == cameraController.currentSide.value;

                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCaptured
                          ? Colors.green
                          : isCurrent
                          ? _getSideColor(side)
                          : Colors.grey.withOpacity(0.5),
                      border: isCurrent ? Border.all(color: Colors.white, width: 2) : null,
                    ),
                    child: Icon(
                      isCaptured ? Icons.check : _getSideIcon(side),
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                });
              }).toList(),
            ),
          ),

          // Bottom Capture Button
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Obx(() => GestureDetector(
              onTap: cameraController.isCapturing.value
                  ? null
                  : cameraController.captureImage,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cameraController.isCapturing.value
                      ? Colors.grey
                      : _getSideColor(cameraController.currentSide.value),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: cameraController.isCapturing.value
                      ? CircularProgressIndicator(color: Colors.white)
                      : Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            )),
          ),

          // Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSideColor(PictureSide side) {
    switch (side) {
      case PictureSide.front:
        return AppColors.mainColor;
      case PictureSide.left:
        return Colors.orange;
      case PictureSide.right:
        return Colors.purple;
      case PictureSide.back:
        return Colors.red;
    }
  }

  IconData _getSideIcon(PictureSide side) {
    switch (side) {
      case PictureSide.front:
        return Icons.face;
      case PictureSide.left:
        return Icons.keyboard_arrow_left;
      case PictureSide.right:
        return Icons.keyboard_arrow_right;
      case PictureSide.back:
        return Icons.keyboard_arrow_up;
    }
  }
}