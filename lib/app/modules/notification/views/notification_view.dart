import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/widget/common_app_bar.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  final List<Map<String, String>> notifications = const [
    {
      'status': 'pending',
      'message': 'Welcome to HeadScan Pro! Your account is pending review by our team. You’ll be notified once approved.',
      'time': '10:12 AM'
    },
    {
      'status': 'approved',
      'message': 'Your account has been approved! You can now start scanning.',
      'time': '10:12 AM'
    },
    {
      'status': 'denied',
      'message': 'Your account application was not approved. Please contact support for details.',
      'time': '10:12 AM'
    },
    {
      'status': 'approved',
      'message': 'Your account has been approved! You can now start scanning.',
      'time': '10:12 AM'
    },
    {
      'status': 'approved',
      'message': 'Your account has been approved! You can now start scanning.',
      'time': '10:12 AM'
    },
    {
      'status': 'pending',
      'message': 'Welcome to HeadScan Pro! Your account is pending review by our team. You’ll be notified once approved.',
      'time': '10:12 AM'
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'approved':
        return Colors.green;
      case 'denied':
        return Colors.red;
      case 'pending':
      default:
        return Colors.orange;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'approved':
        return Icons.check_circle;
      case 'denied':
        return Icons.cancel;
      case 'pending':
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CommonAppBar(title: 'Notifications', isNotification: false),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        _getStatusIcon(item['status']!),
                        color: _getStatusColor(item['status']!),
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['status']!.toUpperCase() + ':',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _getStatusColor(item['status']!),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['message']!,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item['time']!,
                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
