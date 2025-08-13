import 'package:data_collection_app/app/modules/setting/views/change_password_view.dart';
import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:data_collection_app/resource/dialog/custom_dialog.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/widget/common_app_bar.dart';
import '../../profile/widget/profile_menu_item.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommonAppBar(title: 'Setting'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ProfileMenuItem(
                  icon: Icons.lock,
                  title: "Change password",
                  onTap: () {
                    Get.to(()=>ChangePasswordView());
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.language,
                  title: "Language",
                  trailingText: selectedLanguage,
                  onTap: () => _showLanguageDialog(context),
                ),
                ProfileMenuItem(
                  icon: Icons.delete,
                  title: "Delete account",
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: () => CustomAlertDialog().showDeleteAccountDialog(
                    context,
                        () {
                      Navigator.pop(context);
                    },
                    false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final List<String> languages = ['English', 'Bangla', 'Hindi'];

    showDialog(
      context: context,
      builder: (ctx) {
        String tempSelected = selectedLanguage;

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text("Select Language", style: CommonStyle.textStyleMedium(),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: languages.map((lang) {
                  return RadioListTile<String>(
                    activeColor: AppColors.mainColor,
                    title: Text(
                      lang,
                      style: TextStyle(
                        color: lang == tempSelected ? AppColors.mainColor : Colors.black,
                        fontWeight:
                        lang == tempSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    value: lang,
                    groupValue: tempSelected,
                    onChanged: (value) {
                      setStateDialog(() {
                        tempSelected = value!;
                      });
                    },
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text('Cancel', style: CommonStyle.textStyleSmall(size: 14),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedLanguage = tempSelected;
                    });
                    Navigator.pop(ctx);
                  },
                  child: Text('OK', style: CommonStyle.textStyleSmall(color: Colors.white, size: 14),),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
