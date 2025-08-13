import 'package:data_collection_app/app/modules/my_scan_details/widget/custom_slider.dart';
import 'package:data_collection_app/app/modules/my_scan_details/widget/section_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../profile/widget/common_app_bar.dart';
import '../controllers/my_scan_details_controller.dart';
import '../widget/details_row.dart';

class MyScanDetailsView extends GetView<MyScanDetailsController> {
  MyScanDetailsView({super.key});
  final List<String> imageList = [
    'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommonAppBar(title: 'My Scan Details'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
              
                  CustomSlider(
                      imageUrls: imageList,
                  ),
                  SizedBox(height: 20),
                  DetailsRow(title: "Name", value: "John Doe", highlight: true),
                  DetailsRow(title: "Date of Scan", value: "August 7, 2025", highlight: false),
                  DetailsRow(title: "Head Width", value: "15.2 cm", highlight: true),
                  DetailsRow(title: "Head Length", value: "19.8 cm", highlight: false),
                  DetailsRow(title: "Ear-to-Ear", value: "12.4 cm", highlight: true),
                  DetailsRow(title: "Eye-to-Eye", value: "6.5 cm", highlight: false),

                  const SizedBox(height: 12),
                  SectionCard(
                      title: "Notes",
                      child: '“ This scan was taken after a recent haircut.”  '
                          '“Please prioritize comfort over thickness.”  “This is for a teenager.”',
                      highlight: true
                  ),

                  const SizedBox(height: 12),
                  SectionCard(
                      title: "Custom Fit",
                      child: '“Slightly tighter around the back of the head.”  “Looser fit near ears due to '
                          'sensitivity.”  “Include extra padding on the crown.”',
                      highlight: false
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
