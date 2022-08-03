import 'package:flutter/cupertino.dart';

class ResponsiveModel {
  static double getHeight(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double getWidth(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }
}
