import 'package:get/get.dart';

import '../controllers/my_scan_controller.dart';

class MyScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyScanController>(
      () => MyScanController(),
    );
  }
}
