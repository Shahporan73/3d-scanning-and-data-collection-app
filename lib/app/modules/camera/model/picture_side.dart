// models/picture_side.dart
enum PictureSide { front, left, right, back }

extension PictureSideExtension on PictureSide {
  String get displayName {
    switch (this) {
      case PictureSide.front:
        return 'Front';
      case PictureSide.left:
        return 'Left';
      case PictureSide.right:
        return 'Right';
      case PictureSide.back:
        return 'Back';
    }
  }

  String get instruction {
    switch (this) {
      case PictureSide.front:
        return 'Position yourself facing the camera';
      case PictureSide.left:
        return 'Turn your head to show the left side';
      case PictureSide.right:
        return 'Turn your head to show the right side';
      case PictureSide.back:
        return 'Turn around to show the back of your head';
    }
  }
}