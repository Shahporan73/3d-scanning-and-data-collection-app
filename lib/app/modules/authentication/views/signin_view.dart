import 'package:data_collection_app/app/modules/authentication/views/signup_view.dart';
import 'package:data_collection_app/app/modules/how_to_use_scan/views/how_to_use_scan_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/app_colors/App_Colors.dart';
import '../../../../resource/app_images/app_images.dart';
import '../../../../resource/comon_widget/custom_button.dart';
import '../../../../resource/comon_widget/custom_checkbox.dart';
import '../../../../resource/comon_widget/custom_text.dart';
import '../../../../resource/comon_widget/custom_text_field.dart';
import '../../../../resource/utilitis/common_style.dart';
import '../controllers/authentication_controller.dart';
import '../widget/auth_header.dart';
import 'forgot_password_view.dart';

class SigninView extends GetView<AuthenticationController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthenticationController controller = Get.put(AuthenticationController());
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
                  firstPart: "Welcome! ",
                  highlightPart: "Sign In",
                  lastPart: " to Your App Portal",
                ),
                SizedBox(height: 20,),
                Text('Address', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: 'Enter address here...',),

                SizedBox(height: 10,),
                Text('Password', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: '***************', obscureText: true,),


                SizedBox(height: 20,),
                Row(
                  children: [
                    Obx(
                    ()=> CustomCheckBox(
                          size: 20,
                          isChecked: controller.checkRemember.value,
                          onChanged: (value) {
                            controller.checkRemember.value = value;
                          }),
                    ),
                    SizedBox(width: 5,),
                    CustomText(title: 'Remember me',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(()=> ForgotPasswordView());
                      },
                      child: CustomText(
                        title: 'Forgot password', fontWeight: FontWeight
                          .bold, fontSize: 15,),
                    ),
                  ],
                ),

                SizedBox(height: 30,),
                CustomButton(title: 'Sign In', onTap: (){
                  Get.to(()=>HowToUseScanView());
                },),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ', style: CommonStyle.textStyleMedium(size: 16),),
                    InkWell(
                      onTap: (){Get.to(()=>SignupView());},
                      child: Text('Sign Up', style: CommonStyle.textStyleMedium(size: 16, color: AppColors.mainColor),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
