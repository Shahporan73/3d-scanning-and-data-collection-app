import 'package:get/get.dart';

import '../controllers/how_to_use_scan_controller.dart';

class HowToUseScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowToUseScanController>(
      () => HowToUseScanController(),
    );
  }
}
