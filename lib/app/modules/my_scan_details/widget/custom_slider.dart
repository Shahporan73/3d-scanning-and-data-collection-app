import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../resource/app_colors/App_Colors.dart';
import '../../../../resource/comon_widget/custom_network_image.dart';
import '../../../../resource/dialog/custom_dialog.dart';

class CustomSlider extends StatefulWidget {
  final List<String> imageUrls;
  const CustomSlider({super.key, required this.imageUrls});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: Get.height / 3.5,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 0.99,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.imageUrls.map((url) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      CustomAlertDialog().showFullScreenImageDialog(context: context, imageUrl: url);
                    },
                    child: CustomNetworkImage(
                      imageUrl: url,
                      width: double.infinity,
                      height: Get.height / 3.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.asMap().entries.map((entry) {
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? AppColors.mainColor
                    : Colors.grey.shade400,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
