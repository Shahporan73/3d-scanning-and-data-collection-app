// file: otp_controller.dart
import 'dart:async';
import 'package:get/get.dart';

class OtpController extends GetxController {
  RxInt secondsRemaining = 60.obs;
  RxBool enableResend = false.obs;
  Timer? _timer;

  void startTimer() {
    enableResend.value = false;
    secondsRemaining.value = 60;
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
        _timer?.cancel();
      }
    });
  }

  void resendCode() {
    // Here you can call your OTP resend API if needed
    startTimer();
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
