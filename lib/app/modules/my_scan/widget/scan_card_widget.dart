import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resource/comon_widget/custom_button.dart';
import '../../../../resource/utilitis/common_style.dart';
import '../../my_scan_details/views/my_scan_details_view.dart';

class ScanCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final VoidCallback onViewDetails;

  const ScanCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff268CBE).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                CustomButton(
                    title: 'View Details',
                    buttonColor: Color(0xff268CBE).withOpacity(0.3),
                    titleColor: Color(0xff268CBE),
                    onTap: () {
                      Get.to(()=>MyScanDetailsView());
                    },
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View Details', style: CommonStyle.textStyleMedium(color: AppColors.mainColor, size: 12, fontWeight: FontWeight.bold),),
                      ],
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}