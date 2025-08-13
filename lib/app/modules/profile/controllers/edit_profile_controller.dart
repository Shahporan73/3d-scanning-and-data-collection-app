import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resource/utilitis/custom_toast.dart';

class EditProfileController extends GetxController {
  // Dummy profile data
  var firstName = 'Jamal'.obs;
  var role = 'User'.obs;
  var clinicName = 'Health First Clinic'.obs;
  var dob = '01-01-1990'.obs;
  var address = '123 Street, Dhaka'.obs;

  // Form fields controllers
  final firstNameController = TextEditingController();
  final clinicNameController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();

  // Selected Role
  var selectedRole = ''.obs;

  @override
  void onInit() {
    // Fill controllers with dummy data
    firstNameController.text = firstName.value;
    clinicNameController.text = clinicName.value;
    dobController.text = dob.value;
    addressController.text = address.value;
    selectedRole.value = role.value;
    super.onInit();
  }

  bool validateFields() {
    if (firstNameController.text.isEmpty) return false;
    if (selectedRole.value.isEmpty) return false;
    if (clinicNameController.text.isEmpty) return false;
    if (dobController.text.isEmpty) return false;
    if (addressController.text.isEmpty) return false;
    return true;
  }

  void updateProfile() {
    if (validateFields()) {
      CustomToast.showToast(
        message: 'Profile Updated Successfully',
        isError: false,
      );
      Get.back();
    } else {
      CustomToast.showToast(
        message: 'Please fill all fields',
        isError: true,
      );
    }
  }
}
