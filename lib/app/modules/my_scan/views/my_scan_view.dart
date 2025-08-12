import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../profile/widget/common_app_bar.dart';
import '../controllers/my_scan_controller.dart';

class MyScanView extends GetView<MyScanController> {
  const MyScanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          CommonAppBar(title: 'My Scan',),
        ],
      ),
    );
  }
}
