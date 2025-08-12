import 'package:data_collection_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:data_collection_app/app/modules/how_to_use_scan/widget/custom_header.dart';
import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:data_collection_app/resource/app_images/app_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/how_to_use_scan_controller.dart';
import '../widget/custom_build_step_card.dart';

class HowToUseScanView extends GetView<HowToUseScanController> {
  const HowToUseScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            CustomHeader(),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppImages.howToUseScanImage,
                          width: double.maxFinite,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 16),
                      // Title
                      Text(
                        "How to Use 3D Scanner",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Follow these simple steps to capture your perfect 3D head scan",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      // Steps
                      CustomBuildStepCard(
                        icon: Icons.lightbulb_outline,
                        iconColor: Colors.amber,
                        step: "Step 1: Get Ready",
                        description:
                        "Find a well-lit room, remove hats or glasses for best accuracy.",
                        bgColor: const Color(0xFFD9F2F7),
                      ),
                      const SizedBox(height: 8),
                      CustomBuildStepCard(
                        icon: Icons.camera_alt_outlined,
                        iconColor: Colors.orange,
                        step: "Step 2: Start Scan",
                        description:
                        "Slowly rotate your head while keeping your face visible to the camera.",
                        bgColor: const Color(0xFFD9F2F7),
                      ),
                      const SizedBox(height: 8),
                      CustomBuildStepCard(
                        icon: Icons.check_circle_outline,
                        iconColor: Colors.green,
                        step: "Step 3: Review & Submit",
                        description:
                        "Preview your scan and submit if it looks good—or retake if needed.",
                        bgColor: const Color(0xFFD9F7E0),
                      ),
                      const SizedBox(height: 8),
                      CustomBuildStepCard(
                        icon: Icons.warning_amber_rounded,
                        iconColor: Colors.red,
                        step: "Step 5: Warning",
                        description:
                        "The app only accepts 3D model files with these extensions: .obj, .ply, .glb, .stl.\nFile size limit is set to 300 MB max — anything larger is rejected.",
                        bgColor: const Color(0xFFFDE5E5),
                      ),

                      const SizedBox(height: 20),

                      // Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: Text(
                                "Start Scan Now",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Get.to(()=> Dashboard());
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.mainColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: Text(
                                "Go To Homepage",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
