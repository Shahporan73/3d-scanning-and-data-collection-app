import 'package:data_collection_app/app/modules/authentication/views/signin_view.dart';
import 'package:data_collection_app/app/modules/authentication/widget/auth_header.dart';
import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:data_collection_app/resource/app_images/app_images.dart';
import 'package:data_collection_app/resource/comon_widget/custom_button.dart';
import 'package:data_collection_app/resource/comon_widget/custom_country_picker.dart';
import 'package:data_collection_app/resource/comon_widget/custom_drop_down_widget.dart';
import 'package:data_collection_app/resource/comon_widget/custom_text_field.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
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
                  firstPart: "Let's Go! ",
                  highlightPart: "Sign Up",
                  lastPart: " to Your App Portal",
                ),
                SizedBox(height: 20),

                // Profile Picture Section
                Text('Upload Profile Picture', style: CommonStyle.textStyleMedium(size: 16)),
                SizedBox(height: 8),
                Obx(() => GestureDetector(
                  onTap: controller.pickImage,
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.validationController.profileImageError.value.isNotEmpty
                              ? Colors.red
                              : Colors.grey.shade300
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.profileImage.value != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        controller.profileImage.value!,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt,
                            size: 40,
                            color: AppColors.mainColor),
                        SizedBox(height: 8),
                        Text('Tap to select image',
                            style: CommonStyle.textStyleMedium(
                                size: 14,
                                color: AppColors.mainColor)),
                      ],
                    ),
                  ),
                )),
                Obx(() => controller.validationController.profileImageError.value.isNotEmpty
                    ? Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    controller.validationController.profileImageError.value,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
                    : SizedBox()),

                SizedBox(height: 16),

                // Name Fields
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('First Name', style: CommonStyle.textStyleMedium(size: 16)),
                          SizedBox(height: 4),
                          Obx(() => CustomTextField(
                            hint: 'First Name',
                            controller: controller.firstNameController,
                            errorText: controller.validationController.firstNameError.value.isEmpty
                                ? null
                                : controller.validationController.firstNameError.value,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Last Name', style: CommonStyle.textStyleMedium(size: 16)),
                          SizedBox(height: 4),
                          Obx(() => CustomTextField(
                            hint: 'Last Name',
                            controller: controller.lastNameController,
                            errorText: controller.validationController.lastNameError.value.isEmpty
                                ? null
                                : controller.validationController.lastNameError.value,
                          )),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 16),

                // Role Dropdown
                Text('Role', style: CommonStyle.textStyleMedium(size: 16)),
                SizedBox(height: 4),
                Obx(() => CustomDropDownWidget(
                  items: ['Admin', 'User'],
                  hintText: 'Select Role',
                  selectedValue: controller.selectedRole.value.isEmpty
                      ? null
                      : controller.selectedRole.value,
                  onChanged: (value) {
                    controller.selectedRole.value = value ?? '';
                    controller.validationController.roleError.value = '';
                  },
                  // errorText: controller.validationController.roleError.value.isEmpty
                  //     ? null
                  //     : controller.validationController.roleError.value,
                )),

                SizedBox(height: 16),

                // Clinic Name
                Text('Clinic Name', style: CommonStyle.textStyleMedium(size: 16)),
                SizedBox(height: 4),
                Obx(() => CustomTextField(
                  hint: 'Enter Clinic Name',
                  controller: controller.clinicNameController,
                  errorText: controller.validationController.clinicNameError.value.isEmpty
                      ? null
                      : controller.validationController.clinicNameError.value,
                )),

                SizedBox(height: 16),

                // Date of Birth
                Text('Date of Birth', style: CommonStyle.textStyleMedium(size: 16)),
                SizedBox(height: 4),
                Obx(() => CustomTextField(
                  hint: 'mm-dd-yyyy',
                  controller: controller.dateOfBirthController,
                  suffixIcon: GestureDetector(
                    onTap: controller.selectDateOfBirth,
                    child: Icon(Icons.calendar_month, color: AppColors.mainColor),
                  ),
                  readOnly: true,
                  onTap: controller.selectDateOfBirth,
                  errorText: controller.validationController.dateOfBirthError.value.isEmpty
                      ? null
                      : controller.validationController.dateOfBirthError.value,
                )),

                SizedBox(height: 16),

                // Contact Number
                Obx(() => CustomCountryPicker(
                  titleText: 'Contact Number',
                  hintText: 'Enter Contact Number',
                  controller: controller.contactNumberController,
                  defaultIsoCode: 'BD',
                  selectedCountryCode: controller.selectedCountryCode.value,
                  onCountryChanged: (code) {
                    controller.selectedCountryCode.value = code;
                    controller.validationController.contactNumberError.value = '';
                  },
                  errorText: controller.validationController.contactNumberError.value.isEmpty
                      ? null
                      : controller.validationController.contactNumberError.value,
                )),

                SizedBox(height: 16),

                // Address
                Text('Address', style: CommonStyle.textStyleMedium(size: 16)),
                SizedBox(height: 4),
                Obx(() => CustomTextField(
                  hint: 'Enter address here...',
                  controller: controller.addressController,
                  maxLine: 3,
                  errorText: controller.validationController.addressError.value.isEmpty
                      ? null
                      : controller.validationController.addressError.value,
                )),

                SizedBox(height: 16),

                // Password
                Text('Password', style: CommonStyle.textStyleMedium(size: 16)),
                SizedBox(height: 4),
                Obx(() => CustomTextField(
                  hint: '***************',
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  suffixIcon: GestureDetector(
                    onTap: controller.togglePasswordVisibility,
                    child: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.mainColor,
                    ),
                  ),
                  errorText: controller.validationController.passwordError.value.isEmpty
                      ? null
                      : controller.validationController.passwordError.value,
                )),

                SizedBox(height: 16),

                // Confirm Password
                Text('Confirm Password', style: CommonStyle.textStyleMedium(size: 16)),
                SizedBox(height: 4),
                Obx(() => CustomTextField(
                  hint: '***************',
                  controller: controller.confirmPasswordController,
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  suffixIcon: GestureDetector(
                    onTap: controller.toggleConfirmPasswordVisibility,
                    child: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.mainColor,
                    ),
                  ),
                  errorText: controller.validationController.confirmPasswordError.value.isEmpty
                      ? null
                      : controller.validationController.confirmPasswordError.value,
                )),

                SizedBox(height: 24),

                // Sign Up Button
                CustomButton(
                  title: 'Sign Up',
                  onTap: controller.signUp,
                ),

                SizedBox(height: 20),

                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ',
                        style: CommonStyle.textStyleMedium(size: 16)),
                    InkWell(
                      onTap: () => Get.to(() => SigninView()),
                      child: Text('Sign In',
                          style: CommonStyle.textStyleMedium(
                              size: 16,
                              color: AppColors.mainColor)),
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