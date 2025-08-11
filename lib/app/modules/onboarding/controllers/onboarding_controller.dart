import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var isLoading = false.obs;
  Future<void> goNext() async {
    await Future.delayed(const Duration(seconds: 2, milliseconds: 500));
    // Navigate to next screen
    Get.offAllNamed('/home');
  }
}
