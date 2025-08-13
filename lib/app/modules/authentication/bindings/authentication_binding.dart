import 'package:get/get.dart';

import 'package:data_collection_app/app/modules/authentication/controllers/otp_controller_controller.dart';
import 'package:data_collection_app/app/modules/authentication/controllers/sign_up_validation_controller.dart';
import 'package:data_collection_app/app/modules/authentication/controllers/signup_controller.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
    Get.lazyPut<SignupValidationController>(
      () => SignupValidationController(),
    );
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(),
    );
  }
}
