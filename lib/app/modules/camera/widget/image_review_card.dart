// widgets/image_review_card.dart
import 'package:data_collection_app/app/modules/camera/model/picture_side.dart';
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

          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  capturedImage.side.displayName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: onRetake,
                      child: Icon(Icons.refresh, color: Colors.blue),
                    ),
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