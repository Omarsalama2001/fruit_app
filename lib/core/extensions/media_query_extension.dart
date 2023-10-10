import 'package:flutter/widgets.dart';

extension MediaQueryExtension on BuildContext {
  double getHight({required double divide}) {
    return MediaQuery.of(this).size.height * divide;
  }

  double getWidth({required double divide}) {
    return MediaQuery.of(this).size.width * divide;
  }
}
