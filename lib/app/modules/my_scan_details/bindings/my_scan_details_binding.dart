import 'package:get/get.dart';

import '../controllers/my_scan_details_controller.dart';

class MyScanDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyScanDetailsController>(
      () => MyScanDetailsController(),
    );
  }
}
