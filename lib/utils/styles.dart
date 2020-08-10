import 'dart:ui';

class Styles {}

class FontColors {
  static final gray = "#B6BFC2".toColor();
  static final darkBlue = "#0D2834".toColor();
  static final gold = "#C8A574".toColor();
  static final white = "#FFFFFF".toColor();
}

class SurfaceColors {
  static final lightGray = "#E8ECEE".toColor();
  static final mediumGray = "#B6BFC2".toColor();
  static final darkBlue = "#0D2834".toColor();
  static final gold = "#C8A574".toColor();
  static final white = "#FFFFFF".toColor();
}

class NotificationColors {
  static final error = "#EB5757".toColor();
  static final danger = "#FFAB00".toColor();
  static final success = "#21CA7C".toColor();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
