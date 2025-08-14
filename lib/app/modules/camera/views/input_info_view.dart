import 'package:data_collection_app/app/modules/camera/controllers/camera_controller.dart';
import 'package:data_collection_app/app/modules/camera/views/camera_view.dart';
import 'package:data_collection_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:data_collection_app/resource/comon_widget/custom_button.dart';
import 'package:data_collection_app/resource/comon_widget/custom_text_field.dart';
import 'package:data_collection_app/resource/dialog/custom_dialog.dart';
import 'package:data_collection_app/resource/utilitis/custom_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/utilitis/common_style.dart';
import '../../profile/widget/common_app_bar.dart';

class InputInfoView extends GetView<CameraController> {
  const InputInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CameraController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommonAppBar(title: 'Input Info'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Please provide the following information:",
                      style: CommonStyle.textStyleMedium(size: 14, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    "Name",
                    style: CommonStyle.textStyleMedium(size: 14, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  CustomTextField(hint: 'Enter your name',),

                  const SizedBox(height: 16),
                  Text(
                    "Notes",
                    style: CommonStyle.textStyleMedium(size: 14, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    hint: 'Notes (e.g., helmet purpose, special requirements)',
                    maxLine: 8,
                    keyboardType: TextInputType.multiline,
                    vertical_padding: 16,
                    height: Get.height / 3.5,
                  ),

                  const SizedBox(height: 16),
                  Text(
                    "Custom Field (Optional)",
                    style: CommonStyle.textStyleMedium(size: 14, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  CustomTextField(hint: 'Custom Field',),

                  const SizedBox(height: 16),
                  CustomButton(title: 'Submit Scan Now', onTap: (){
                    CustomAlertDialog().customAlert(
                        context: context,
                        title: '🎉 Congratulations!',
                        message: 'Your scan has been successfully submitted. Our team will now review your data to begin the custom fitting process.',
                        NegativebuttonText: 'Scan Another',
                        PositivvebuttonText: 'Done',
                        onPositiveButtonPressed: () {
                          Get.offAll(()=>Dashboard());
                        },
                        onNegativeButtonPressed: () {
                          Get.to(()=>CameraView());
                        },
                    );
                  }),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
