import 'dart:ui';

import 'package:flutter/cupertino.dart';

extension HexColor on Color {
  /// String is in the format "abc" "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    hexString = hexString.replaceFirst('#', '');
    if (hexString.length == 3) {
      hexString = 'f' + hexString;
    }
    if (hexString.length == 4) {
      hexString.split('').forEach((char) => buffer.write(char + char));
    } else if (hexString.length == 6) {
      buffer.write('ff' + hexString);
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class ThemeColor {
  static Color primaryColor = HexColor.fromHex("#FFC478");
  static Color secondaryColor = HexColor.fromHex("#FF8E3E");
  static Color buttonColor = HexColor.fromHex("#D95227");
  static Color textFieldColor = HexColor.fromHex("#ffe9c9");
}
