// widgets/progress_indicator_widget.dart
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';

import '../model/captured_image.dart';
import '../model/picture_side.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final List<CapturedImage> capturedImages;
  final PictureSide currentSide;

  const ProgressIndicatorWidget({
    Key? key,
    required this.capturedImages,
    required this.currentSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      // margin: EdgeInsets.symmetric(horizontal: 16),
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
        children: [
          // Text('Progress: ${capturedImages.length}/${PictureSide.values.length}',
          //   style: CommonStyle.textStyleSmall()
          // ),
          //
          // SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: PictureSide.values.map((side) {
              final isCaptured = capturedImages.any((img) => img.side == side);
              final isCurrent = side == currentSide;

              return Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCaptured
                          ? Colors.green
                          : isCurrent
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                    child: Icon(
                      isCaptured ? Icons.check : Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    side.displayName,
                    style: CommonStyle.textStyleSmall(),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}