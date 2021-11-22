import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        FittedBox(
          child: Image.asset(
            'assets/images/start_background.png',
          ),
          fit: BoxFit.fill,
        ),
        Container(
          width: Sizes.width(context),
          height: Sizes.heigth(context),
          color: ColorsApp.kOverlayStart,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        )
      ],
    );
  }
}
