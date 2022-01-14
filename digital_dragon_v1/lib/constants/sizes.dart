import 'package:flutter/cupertino.dart';

class Sizes {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double heigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
