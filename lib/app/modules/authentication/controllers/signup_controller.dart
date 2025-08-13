import 'dart:io';
import 'package:data_collection_app/app/modules/authentication/controllers/sign_up_validation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../resource/app_colors/App_Colors.dart';
import '../views/email_verification_for_signup_view.dart';

class SignupController extends GetxController {
  final validationController = Get.put(SignupValidationController());

  // Form controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final clinicNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final contactNumberController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observables
  var selectedRole = ''.obs;
  var selectedCountryCode = '+880'.obs;
  var profileImage = Rx<File?>(null);
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        profileImage.value = File(image.path);
        validationController.profileImageError.value = '';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image');
    }
  }

  Future<void> selectDateOfBirth() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now().subtract(Duration(days: 365 * 18)),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().subtract(Duration(days: 365 * 13)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.mainColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      dateOfBirthController.text = DateFormat('MM-dd-yyyy').format(pickedDate);
      validationController.dateOfBirthError.value = '';
    }
  }

  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  void signUp() {
    if (validationController.validateForm(
      profileImage: profileImage.value,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      role: selectedRole.value,
      clinicName: clinicNameController.text,
      dateOfBirth: dateOfBirthController.text,
      contactNumber: contactNumberController.text,
      address: addressController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    )) {
      Get.to(() => EmailVerificationForSignupView());
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    clinicNameController.dispose();
    dateOfBirthController.dispose();
    contactNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}