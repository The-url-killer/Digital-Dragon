import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key, required this.step}) : super(key: key);

  final int step;

  @override
  Widget build(BuildContext context) {
    double height = 16;
    BorderRadius borderRadius = BorderRadius.circular(height / 2);
    double width = Sizes.width(context) * .9;
    int numberOfSteps = 4;
    double widthProgressbar = ((numberOfSteps - step) / numberOfSteps) * width;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(right: widthProgressbar),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: borderRadius,
      ),
      child: Container(
        height: height - 6,
        width: widthProgressbar,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height - 6 / 2),
          color: ColorsApp.kPrimaryColor,
        ),
      ),
    );
  }
}
