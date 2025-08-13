import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/comon_widget/custom_button.dart';
import '../controllers/camera_controller.dart';
import '../widget/image_review_card.dart';
import '../widget/progress_indicator_widget.dart';

class ReviewImageView extends GetView {
  ReviewImageView({super.key});

  final CameraController cameraController = Get.find<CameraController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Text(
            'Review Your Pictures',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 10),

          Text(
            'Review all captured images. You can delete and retake any image if needed.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),

          SizedBox(height: 20),*/

          // Progress Indicator
          Obx(() => ProgressIndicatorWidget(
            capturedImages: cameraController.capturedImages,
            currentSide: cameraController.currentSide.value,
          )),

          Expanded(
            child: Obx(() => ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: cameraController.capturedImages.length,
              itemBuilder: (context, index) {
                final capturedImage = cameraController.capturedImages[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ImageReviewCard(
                    capturedImage: capturedImage,
                    onDelete: () => cameraController.deleteImage(capturedImage.side),
                    onRetake: () => cameraController.retakePicture(capturedImage.side),
                  ),
                );
              },
            )),
          ),

          SizedBox(height: 20),

          CustomButton(
            title: 'Submit All Images',
            onTap: cameraController.submitImages,
          ),
        ],
      ),
    );
  }
}
