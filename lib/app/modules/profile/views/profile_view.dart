import 'package:data_collection_app/app/modules/how_to_use_scan/views/how_to_use_scan_view.dart';
import 'package:data_collection_app/app/modules/privacy_policy/views/privacy_policy_view.dart';
import 'package:data_collection_app/app/modules/profile/widget/common_app_bar.dart';
import 'package:data_collection_app/app/modules/terms_and_condition/views/terms_and_condition_view.dart';
import 'package:data_collection_app/resource/dialog/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../setting/views/setting_view.dart' show SettingView;
import '../controllers/profile_controller.dart';
import '../widget/profile_menu_item.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommonAppBar(title: 'My Profile'),
          const SizedBox(height: 16),

          // Profile Image
          const CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage("assets/images/face.png"),
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 12),

          // Name
          const Text(
            "Jamal Rakhosh",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Menu List
          Expanded(
            child: ListView(
              children: [
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: "Edit Profile",
                ),
                ProfileMenuItem(
                    icon: Icons.help_outline,
                    title: "How to Use",
                    onTap: () {
                      Get.to(() => HowToUseScanView());
                    },
                ),
                ProfileMenuItem(
                  icon: Icons.call_outlined,
                  title: "Contact Support",
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onTap: () => Get.to(() => const SettingView()),
                ),

                ProfileMenuItem(
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy Policy",
                  onTap: () => Get.to(() => const PrivacyPolicyView()),
                ),
                ProfileMenuItem(
                  icon: Icons.policy_outlined,
                  title: "Terms & Conditions",
                  onTap: () => Get.to(() => const TermsAndConditionView()),
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: "Log Out",
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: () {
                    CustomAlertDialog().customAlert(
                        context: context,
                        title: 'Want to log out?',
                        message: 'Are you sure you want to log out?',
                        NegativebuttonText: 'Cancel',
                        PositivvebuttonText: 'Log out',
                        onPositiveButtonPressed: () => Navigator.pop(context),
                        onNegativeButtonPressed: () => Get.back(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
