import 'package:data_collection_app/app/modules/authentication/dialog/sign_up_dialog.dart';
import 'package:data_collection_app/app/modules/authentication/views/signin_view.dart';
import 'package:data_collection_app/app/modules/authentication/widget/auth_header.dart';
import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:data_collection_app/resource/app_images/app_images.dart';
import 'package:data_collection_app/resource/comon_widget/custom_button.dart';
import 'package:data_collection_app/resource/comon_widget/custom_country_picker.dart';
import 'package:data_collection_app/resource/comon_widget/custom_drop_down_widget.dart';
import 'package:data_collection_app/resource/comon_widget/custom_text.dart';
import 'package:data_collection_app/resource/comon_widget/custom_text_field.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'email_verification_for_signup_view.dart';

class SignupView extends GetView {
  const SignupView({super.key});
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
                  firstPart: "Let’s Go! ",
                  highlightPart: "Sign Up",
                  lastPart: " to Your App Portal",
                ),
                SizedBox(height: 20,),
                Text('Upload Profile Picture', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(
                  prefixIcon: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: CustomText(title: 'Choose File', color: Colors.black,),
                  ),
                  hint: 'No File Chosen',
                  readOnly: true,
                ),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('First Name', style: CommonStyle.textStyleMedium(size: 16),),
                          CustomTextField(hint: 'First Name',),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Last Name', style: CommonStyle.textStyleMedium(size: 16),),
                          CustomTextField(hint: 'First Name',),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 10,),
                Text('Role', style: CommonStyle.textStyleMedium(size: 16),),
                CustomDropDownWidget(
                    items: ['Admin', 'User'],
                    hintText: 'Select Role',
                    onChanged: (value){},
                ),

                SizedBox(height: 10,),
                Text('Clinic Name', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: 'Enter Clinic Name',),

                SizedBox(height: 10,),
                Text('Date of Birth', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: 'mm-dd-yyyy', suffixIcon: Icon(Icons.calendar_month), readOnly: true,),

                SizedBox(height: 10,),
                CustomCountryPicker(
                    titleText: 'Contact Number',
                    hintText: 'Enter Contact Number',
                ),

                SizedBox(height: 10,),
                Text('Address', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: 'Enter address here...',),

                SizedBox(height: 10,),
                Text('Password', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: '***************', obscureText: true,),

                SizedBox(height: 10,),
                Text('Confirm Password', style: CommonStyle.textStyleMedium(size: 16),),
                CustomTextField(hint: '***************', obscureText: true,),

                SizedBox(height: 20,),
                CustomButton(title: 'Sign Up', onTap: (){
                  // showSignUpDialog(context: context);
                  Get.to(()=>EmailVerificationForSignupView());
                  },),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ', style: CommonStyle.textStyleMedium(size: 16),),
                    InkWell(
                      onTap: (){Get.to(()=>SigninView());},
                      child: Text('Sign In', style: CommonStyle.textStyleMedium(size: 16, color: AppColors.mainColor),),
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
