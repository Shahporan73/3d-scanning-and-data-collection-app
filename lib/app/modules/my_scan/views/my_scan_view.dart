import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import 'package:data_collection_app/resource/comon_widget/custom_button.dart';
import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/widget/common_app_bar.dart';
import '../controllers/my_scan_controller.dart';
import '../widget/scan_card_widget.dart';

class MyScanView extends GetView<MyScanController> {
  const MyScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyScanController());
    final scans = controller.scans;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CommonAppBar(title: 'My Scan'),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                      title: 'Add scan',
                      onTap: controller.addScan,
                      widget: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_circle_outline, color: Colors.white,),
                          const SizedBox(width: 5,),
                          Text('Add Scan', style: CommonStyle.textStyleMedium(color: Colors.white, fontWeight: FontWeight.bold),),
                        ],
                      ),
                  ),
                ),

                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                      title: 'This Month',
                      buttonColor: Color(0xff268CBE).withOpacity(0.3),
                      titleColor: Color(0xff268CBE),
                      onTap: controller.filterThisMonth,
                      widget: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_month_outlined, color: AppColors.mainColor,),
                          const SizedBox(width: 5,),
                          Text('This Month', style: CommonStyle.textStyleMedium(color: AppColors.mainColor, fontWeight: FontWeight.bold),),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () => GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                itemCount: scans.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final scan = scans[index];
                  return ScanCard(
                    imageUrl: scan.imageUrl,
                    title: scan.title,
                    date: scan.date,
                    onViewDetails: () => controller.viewDetails(scan),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
