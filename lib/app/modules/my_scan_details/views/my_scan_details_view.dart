import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_scan_details_controller.dart';

class MyScanDetailsView extends GetView<MyScanDetailsController> {
  const MyScanDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyScanDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyScanDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
