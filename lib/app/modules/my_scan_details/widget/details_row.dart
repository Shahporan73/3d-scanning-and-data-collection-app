import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  final String title;
  final String value;
  final bool? highlight;
  const DetailsRow({
    super.key,
    required this.title,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: highlight == true ? Colors.blue.shade50 : Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.mainColor, width: 0.5)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: CommonStyle.textStyleMedium(size: 14)),
          Text(
            value,
            style: CommonStyle.textStyleMedium(size: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
