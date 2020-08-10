import 'dart:ui';

class Styles {}

class FontColors {
  static final Color gray = "#B6BFC2".toColor();
  static final Color darkBlue = "#0D2834".toColor();
  static final Color gold = "#C8A574".toColor();
  static final Color white = "#FFFFFF".toColor();
}

class SurfaceColors {
  static final Color lightGray = "#E8ECEE".toColor();
  static final Color mediumGray = "#B6BFC2".toColor();
  static final Color darkBlue = "#0D2834".toColor();
  static final Color gold = "#C8A574".toColor();
  static final Color white = "#FFFFFF".toColor();
}

class NotificationColors {
  static final Color error = "#EB5757".toColor();
  static final Color danger = "#FFAB00".toColor();
  static final Color success = "#21CA7C".toColor();
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
