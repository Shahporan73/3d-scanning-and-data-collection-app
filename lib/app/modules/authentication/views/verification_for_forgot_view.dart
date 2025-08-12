import 'package:data_collection_app/app/modules/authentication/views/reset_password_view.dart';
import 'package:data_collection_app/resource/comon_widget/custom_otp_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/app_colors/App_Colors.dart';
import '../../../../resource/app_images/app_images.dart';
import '../../../../resource/comon_widget/custom_button.dart';
import '../../../../resource/utilitis/common_style.dart';
import '../controllers/otp_controller_controller.dart';
import '../widget/auth_header.dart';

class VerificationForForgotView extends GetView<OtpController> {
  const VerificationForForgotView({super.key});
  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    final otpController = List.generate(6, (index) => TextEditingController());
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
                  firstPart: "Verify ",
                  highlightPart: "Account",
                  lastPart: "",
                ),
                SizedBox(height: 20,),
                

                Text('Enter Verification Code', style: CommonStyle.textStyleMedium(size: 16),),
                SizedBox(height: 10,),
                CustomOtpWidget(controllers: otpController, borderColor: Colors.grey,),


                /// TIMER SECTION
                SizedBox(height: 20),
                Center(
                  child: Obx(() => controller.enableResend.value
                      ? CustomButton(
                    onTap: controller.resendCode,
                    title: 'Resend Code',
                    buttonColor: Colors.white,
                    titleColor: AppColors.mainColor,
                    border: Border.all(color: AppColors.mainColor),
                    width: Get.width / 2,
                  )
                      : Text(
                    'Resend code in ${controller.secondsRemaining.value}s',
                    style: CommonStyle.textStyleSmall(size: 14, color: Colors.grey),
                  )),
                ),


                SizedBox(height: 20,),
                CustomButton(title: 'Verify Account', onTap: (){Get.to(() => ResetPasswordView());},),

                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
