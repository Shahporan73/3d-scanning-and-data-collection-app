import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../profile/widget/common_app_bar.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          CommonAppBar(title: 'Notification', isNotification: false,),
        ],
      ),
    );
  }
}
