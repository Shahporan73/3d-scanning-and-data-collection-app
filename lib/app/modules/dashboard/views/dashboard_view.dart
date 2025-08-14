import 'package:data_collection_app/app/modules/my_scan/views/my_scan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../camera/views/camera_view.dart';
import '../../camera/views/take_image_by_camera_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeView(), // Home always visible
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(Icons.person, "My Profile", () {
                Get.to(() => const ProfileView());
              }),
              const SizedBox(width: 60),
              buildNavItem(Icons.qr_code, "My Scan", () {
                Get.to(() => const MyScanView());
              }),
            ],
          ),
        ),

        // Center floating button
        Positioned(
          top: -25,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: GestureDetector(
            onTap: () {
              // Get.snackbar("Plus Button", "You tapped the add button!");
              Get.to(() => const CameraView());
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                size: 32,
                color: Colors.blue.shade700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNavItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue.shade700),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.blue.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
