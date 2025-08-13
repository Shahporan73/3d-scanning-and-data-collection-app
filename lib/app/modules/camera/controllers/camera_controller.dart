// controllers/camera_controller.dart
import 'dart:io';
import 'package:camera/camera.dart' as cam;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:fluttertoast/fluttertoast.dart';

import '../model/captured_image.dart';
import '../model/picture_side.dart';

class CameraController extends GetxController {
  cam.CameraController? cameraController;
  RxBool isCameraInitialized = false.obs;
  RxBool isCapturing = false.obs;
  RxList<CapturedImage> capturedImages = <CapturedImage>[].obs;
  Rx<PictureSide> currentSide = PictureSide.front.obs;
  RxBool isAllPicturesComplete = false.obs;

  List<cam.CameraDescription> cameras = [];

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    try {
      // Request camera permission
      final cameraPermission = await Permission.camera.request();
      if (cameraPermission != PermissionStatus.granted) {
        showCustomToast('Camera permission is required to capture pictures');
        return;
      }

      // Get available cameras
      cameras = await cam.availableCameras();
      if (cameras.isEmpty) {
        showCustomToast('No cameras found on this device');
        return;
      }

      // Initialize front camera (index 1) or back camera (index 0) if front not available
      final frontCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == cam.CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      cameraController = cam.CameraController(
        frontCamera,
        cam.ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      showCustomToast('Error initializing camera: ${e.toString()}');
    }
  }

  Future<void> captureImage() async {
    if (!isCameraInitialized.value || isCapturing.value) return;

    try {
      isCapturing.value = true;

      final cam.XFile image = await cameraController!.takePicture();

      // Check if image is clear (basic validation - you can enhance this)
      if (await _isImageClear(image.path)) {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = '${currentSide.value.name}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final filePath = path.join(directory.path, fileName);

        await File(image.path).copy(filePath);

        // Remove existing image for this side if any
        capturedImages.removeWhere((img) => img.side == currentSide.value);

        // Add new captured image
        capturedImages.add(CapturedImage(
          path: filePath,
          side: currentSide.value,
          capturedAt: DateTime.now(),
        ));

        showCustomToast('${currentSide.value.displayName} picture captured successfully!');

        // Move to next side or complete
        _moveToNextSide();

      } else {
        showCustomToast('Picture is not clear. Please try again with better lighting.');
      }
    } catch (e) {
      showCustomToast('Error capturing image: ${e.toString()}');
    } finally {
      isCapturing.value = false;
    }
  }

  Future<bool> _isImageClear(String imagePath) async {
    // Basic image clarity check - you can implement more sophisticated logic
    final file = File(imagePath);
    final size = await file.length();

    // If image is too small, it might be corrupted or unclear
    return size > 50000; // 50KB minimum
  }

  void _moveToNextSide() {
    final allSides = PictureSide.values;
    final currentIndex = allSides.indexOf(currentSide.value);

    // Find next uncaptured side
    for (int i = currentIndex + 1; i < allSides.length; i++) {
      if (!capturedImages.any((img) => img.side == allSides[i])) {
        currentSide.value = allSides[i];
        return;
      }
    }

    // Check if all pictures are captured
    _checkCompletion();
  }

  void _checkCompletion() {
    final requiredSides = PictureSide.values;
    final capturedSides = capturedImages.map((img) => img.side).toSet();

    if (requiredSides.every((side) => capturedSides.contains(side))) {
      isAllPicturesComplete.value = true;
      showCustomToast('All pictures captured! You can now review and submit.');
    } else {
      // Find first missing side
      final missingSide = requiredSides.firstWhere(
            (side) => !capturedSides.contains(side),
      );
      currentSide.value = missingSide;
      showCustomToast('Please capture ${missingSide.displayName} picture');
    }
  }

  void deleteImage(PictureSide side) {
    try {
      final imageToDelete = capturedImages.firstWhere((img) => img.side == side);

      // Delete file from storage
      final file = File(imageToDelete.path);
      if (file.existsSync()) {
        file.deleteSync();
      }

      // Remove from list
      capturedImages.removeWhere((img) => img.side == side);

      // Update completion status
      isAllPicturesComplete.value = false;
      currentSide.value = side;

      showCustomToast('${side.displayName} picture deleted');
    } catch (e) {
      showCustomToast('Error deleting image: ${e.toString()}');
    }
  }

  void retakePicture(PictureSide side) {
    deleteImage(side);
    currentSide.value = side;
  }

  List<String> getImagePathsForSubmission() {
    return capturedImages.map((img) => img.path).toList();
  }

  Future<void> submitImages() async {
    if (!isAllPicturesComplete.value) {
      showCustomToast('Please capture all required pictures before submitting');
      return;
    }

    try {
      final imagePaths = getImagePathsForSubmission();

      // Here you would implement your backend submission logic
      // For example:
      // await ApiService.submitHelmetImages(imagePaths);

      showCustomToast('Images submitted successfully!');

      // Clear captured images after successful submission
      _clearAllImages();

    } catch (e) {
      showCustomToast('Error submitting images: ${e.toString()}');
    }
  }

  void _clearAllImages() {
    // Delete all captured files
    for (final image in capturedImages) {
      final file = File(image.path);
      if (file.existsSync()) {
        file.deleteSync();
      }
    }

    // Clear the list
    capturedImages.clear();
    isAllPicturesComplete.value = false;
    currentSide.value = PictureSide.front;
  }

  void showCustomToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}