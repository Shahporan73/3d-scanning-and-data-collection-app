import 'dart:io';
import 'package:get/get.dart';

class SignupValidationController extends GetxController {
  // Error messages
  var firstNameError = ''.obs;
  var lastNameError = ''.obs;
  var roleError = ''.obs;
  var clinicNameError = ''.obs;
  var dateOfBirthError = ''.obs;
  var contactNumberError = ''.obs;
  var addressError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;
  var profileImageError = ''.obs;

  void clearErrors() {
    firstNameError.value = '';
    lastNameError.value = '';
    roleError.value = '';
    clinicNameError.value = '';
    dateOfBirthError.value = '';
    contactNumberError.value = '';
    addressError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';
    profileImageError.value = '';
  }

  bool validateForm({
    required File? profileImage,
    required String firstName,
    required String lastName,
    required String role,
    required String clinicName,
    required String dateOfBirth,
    required String contactNumber,
    required String address,
    required String password,
    required String confirmPassword,
  }) {
    clearErrors();
    bool isValid = true;

    // Profile Image Validation
    if (profileImage == null) {
      profileImageError.value = 'Please select a profile picture';
      isValid = false;
    }

    // First Name Validation
    if (firstName.trim().isEmpty) {
      firstNameError.value = 'First name is required';
      isValid = false;
    } else if (firstName.trim().length < 2) {
      firstNameError.value = 'First name must be at least 2 characters';
      isValid = false;
    }

    // Last Name Validation
    if (lastName.trim().isEmpty) {
      lastNameError.value = 'Last name is required';
      isValid = false;
    } else if (lastName.trim().length < 2) {
      lastNameError.value = 'Last name must be at least 2 characters';
      isValid = false;
    }

    // Clinic Name Validation
    if (clinicName.trim().isEmpty) {
      clinicNameError.value = 'Clinic name is required';
      isValid = false;
    }

    // Date of Birth Validation
    if (dateOfBirth.trim().isEmpty) {
      dateOfBirthError.value = 'Date of birth is required';
      isValid = false;
    }

    // Contact Number Validation
    if (contactNumber.trim().isEmpty) {
      contactNumberError.value = 'Contact number is required';
      isValid = false;
    } else if (contactNumber.trim().length < 10) {
      contactNumberError.value = 'Contact number must be at least 10 digits';
      isValid = false;
    } else if (!RegExp(r'^[+]?[0-9\s\-\(\)]{10,}$').hasMatch(contactNumber.trim())) {
      contactNumberError.value = 'Please enter a valid contact number';
      isValid = false;
    }

    // Address Validation
    if (address.trim().isEmpty) {
      addressError.value = 'Address is required';
      isValid = false;
    }

    // Password Validation
    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      isValid = false;
    } else if (password.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      isValid = false;
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(password)) {
      passwordError.value = 'Password must contain uppercase, lowercase and number';
      isValid = false;
    }

    // Confirm Password Validation
    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
      isValid = false;
    } else if (confirmPassword != password) {
      confirmPasswordError.value = 'Passwords do not match';
      isValid = false;
    }

    return isValid;
  }
}
