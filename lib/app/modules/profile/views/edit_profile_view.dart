import 'package:data_collection_app/resource/comon_widget/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resource/comon_widget/custom_button.dart';
import '../../../../resource/comon_widget/custom_drop_down_widget.dart';
import '../../../../resource/comon_widget/custom_text_field.dart';
import '../../../../resource/utilitis/common_style.dart';
import '../controllers/edit_profile_controller.dart';
import '../widget/common_app_bar.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommonAppBar(title: 'Edit Profile'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  Center(
                    child: CustomNetworkImage(
                      imageUrl:
                      'https://www.lifewire.com/thmb/0Ny2hOkKIil3c9NYE52avwdaztA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-172997570-9d13dc5ca22840c183cb0e9e943a58e1.jpg',
                      height: Get.height / 6,
                      width: Get.width / 3,
                      boxShape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Name
                  Center(
                    child: Text(
                      controller.firstName.value,
                      style: CommonStyle.textStyleMedium(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text('First Name', style: CommonStyle.textStyleMedium(size: 16)),
                  CustomTextField(
                    hint: 'First Name',
                    controller: controller.firstNameController,
                  ),

                  const SizedBox(height: 10),

                  Text('Role', style: CommonStyle.textStyleMedium(size: 16)),
                  Obx(() => CustomDropDownWidget(
                    items: ['Admin', 'User'],
                    hintText: 'Select Role',
                    selectedValue: controller.selectedRole.value,
                    onChanged: (value) {
                      controller.selectedRole.value = value ?? '';
                    },
                  )),

                  const SizedBox(height: 10),

                  Text('Clinic Name', style: CommonStyle.textStyleMedium(size: 16)),
                  CustomTextField(
                    hint: 'Enter Clinic Name',
                    controller: controller.clinicNameController,
                  ),

                  const SizedBox(height: 10),

                  Text('Date of Birth', style: CommonStyle.textStyleMedium(size: 16)),
                  CustomTextField(
                    hint: 'mm-dd-yyyy',
                    suffixIcon: const Icon(Icons.calendar_month),
                    readOnly: true,
                    controller: controller.dobController,
                  ),

                  const SizedBox(height: 10),

                  Text('Address', style: CommonStyle.textStyleMedium(size: 16)),
                  CustomTextField(
                    hint: 'Enter address here...',
                    controller: controller.addressController,
                  ),

                  const SizedBox(height: 20),

                  CustomButton(
                    title: 'Update Profile',
                    onTap: () {
                      controller.updateProfile();
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
