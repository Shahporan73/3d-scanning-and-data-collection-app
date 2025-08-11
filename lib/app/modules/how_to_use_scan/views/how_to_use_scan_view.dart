import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/how_to_use_scan_controller.dart';

class HowToUseScanView extends GetView<HowToUseScanController> {
  const HowToUseScanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HowToUseScanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HowToUseScanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
