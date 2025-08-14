import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resource/app_images/app_images.dart';
import '../../notification/views/notification_view.dart';

class CommonAppBar extends StatelessWidget {
  final bool isBack;
  final bool isNotification;
  final String title;

  const CommonAppBar({
    super.key,
    this.isBack = true,
    this.isNotification = true,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade400, Colors.white],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isBack)
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 22,),
                ),
              ),
            ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (isNotification)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => Get.to(() => NotificationView()),
                child: Image.asset(
                  AppImages.notificationIcon,
                  width: Get.width / 10,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
