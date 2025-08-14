// views/review_image_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resource/comon_widget/custom_button.dart';
import '../controllers/camera_controller.dart';
import '../widget/image_review_card.dart';
import '../widget/progress_indicator_widget.dart';
import 'input_info_view.dart';

class ReviewImageView extends GetView<CameraController> {
  const ReviewImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => ProgressIndicatorWidget(
                capturedImages: controller.capturedImages,
                currentSide: controller.currentSide.value,
              )),
              SizedBox(height: 10,),
              Expanded(
                child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.capturedImages.length,
                  itemBuilder: (context, index) {
                    final capturedImage = controller.capturedImages[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ImageReviewCard(
                        capturedImage: capturedImage,
                        onDelete: () => controller.deleteImage(capturedImage.side),
                        onRetake: () => controller.retakePicture(capturedImage.side),
                      ),
                    );
                  },
                )),
              ),
        
              SizedBox(height: 20),
        
              CustomButton(
                title: 'Submit All Images',
                onTap: () => controller.submitImages(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}