import 'package:get/get.dart';

// Scan model
class Scan {
  final String imageUrl;
  final String title;
  final String date;

  Scan({required this.imageUrl, required this.title, required this.date});
}

class MyScanController extends GetxController {
  // Reactive list of scans
  var scans = <Scan>[
    Scan(
      imageUrl: 'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
      title: 'Scan #1',
      date: 'July 1, 2025',
    ),
    Scan(
      imageUrl: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
      title: 'Scan #2',
      date: 'Sep 1, 2025',
    ),
    Scan(
      imageUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
      title: 'Scan #3',
      date: 'July 1, 2025',
    ),
  ].obs;

  void addScan() {
    scans.add(
      Scan(
        imageUrl: 'https://images.unsplash.com/photo-1593642532400-2682810df593',
        title: 'New Scan',
        date: 'Aug 13, 2025',
      ),
    );
  }

  void filterThisMonth() {
    scans.value = scans.where((scan) => scan.date.contains('July')).toList();
  }

  void viewDetails(Scan scan) {
    Get.snackbar('Scan Details', 'Viewing details of ${scan.title}');
  }
}
