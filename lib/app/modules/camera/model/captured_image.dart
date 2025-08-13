// models/captured_image.dart
import 'package:data_collection_app/app/modules/camera/model/picture_side.dart';

class CapturedImage {
  final String path;
  final PictureSide side;
  final DateTime capturedAt;

  CapturedImage({
    required this.path,
    required this.side,
    required this.capturedAt,
  });
}