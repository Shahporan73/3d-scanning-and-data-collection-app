import 'package:data_collection_app/resource/comon_widget/custom_button.dart';
import 'package:data_collection_app/resource/comon_widget/custom_text_field.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:data_collection_app/resource/utilitis/custom_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widget/common_app_bar.dart';

class ContactSupportView extends GetView {
  const ContactSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommonAppBar(title: 'Contact Support'),
          
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: CommonStyle.textStyleMedium(size: 16),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(hint: 'Enter your name',),
              
                    SizedBox(height: 20,),
                    Text(
                      "Email Address",
                      style: CommonStyle.textStyleMedium(size: 16),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(hint: 'Enter your email address',),
              
                    SizedBox(height: 20,),
                    Text(
                      "Message",
                      style: CommonStyle.textStyleMedium(size: 16),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'Enter your message',
                      maxLine: 6,
                      height: Get.height / 5,
                      vertical_padding: 16,
                    ),
              
                    SizedBox(height: 20,),
                    CustomButton(
                        title: 'Submit',
                        onTap: (){
                          CustomToast.showToast(message: 'Submitted Successfully');
                          Get.back();
                        }
                    ),
              
                    SizedBox(height: 20,),
              
              
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
