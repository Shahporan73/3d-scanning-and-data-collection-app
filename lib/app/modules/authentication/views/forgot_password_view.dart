import 'package:data_collection_app/app/modules/authentication/views/verification_for_forgot_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/app_images/app_images.dart';
import '../../../../resource/comon_widget/custom_button.dart';
import '../../../../resource/comon_widget/custom_text_field.dart';
import '../../../../resource/utilitis/common_style.dart';
import '../widget/auth_header.dart';

class ForgotPasswordView extends GetView {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.authBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  firstPart: "Forgot ",
                  highlightPart: "Password",
                  lastPart: "",
                ),
                SizedBox(height: 20,),


                Text('Address', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: 'Enter address here...',),


                SizedBox(height: 20,),
                CustomButton(title: 'Send Code', onTap: (){Get.to(() => VerificationForForgotView());},),

                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
