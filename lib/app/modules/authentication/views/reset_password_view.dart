import 'package:data_collection_app/app/modules/authentication/views/signin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/app_images/app_images.dart';
import '../../../../resource/comon_widget/custom_button.dart';
import '../../../../resource/comon_widget/custom_text_field.dart';
import '../../../../resource/utilitis/common_style.dart';
import '../widget/auth_header.dart';

class ResetPasswordView extends GetView {
  const ResetPasswordView({super.key});
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
                  firstPart: "Set Up Your  ",
                  highlightPart: "Password",
                  lastPart: "",
                ),
                SizedBox(height: 20,),


                SizedBox(height: 10,),
                Text('New Password', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: '***************', obscureText: true,),

                SizedBox(height: 10,),
                Text('Confirm Password', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: '***************', obscureText: true,),


                SizedBox(height: 30,),
                CustomButton(title: 'Change Password', onTap: (){
                  Get.to(()=>SigninView());
                },),

                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
