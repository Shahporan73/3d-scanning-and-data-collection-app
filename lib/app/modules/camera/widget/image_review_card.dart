// widgets/image_review_card.dart
import 'package:data_collection_app/app/modules/camera/model/picture_side.dart';
import 'package:data_collection_app/resource/dialog/custom_dialog.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../model/captured_image.dart';

class ImageReviewCard extends StatelessWidget {
  final CapturedImage capturedImage;
  final VoidCallback onDelete;
  final VoidCallback onRetake;

  const ImageReviewCard({
    Key? key,
    required this.capturedImage,
    required this.onDelete,
    required this.onRetake,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                CustomAlertDialog().showFullScreenImageDialog(
                    context: context,
                  imageFile: File(capturedImage.path),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.file(
                  File(capturedImage.path),
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  capturedImage.side.displayName,
                  style: CommonStyle.textStyleSmall(fontWeight: FontWeight.bold, size: 14),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: onRetake,
                      child: Icon(Icons.refresh, color: Colors.blue),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: onDelete,
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}