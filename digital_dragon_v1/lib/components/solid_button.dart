import 'dart:developer';

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SolidButton extends StatefulWidget {
  SolidButton(this.content, this.color, this.fontColor, {Key? key})
      : super(key: key);

  final String content;
  final Color color;
  Color fontColor = ColorsApp.kWhite;

  @override
  _SolidButtonState createState() => _SolidButtonState();
}

class _SolidButtonState extends State<SolidButton> {
  @override
  Widget build(BuildContext context) {
    const double borderRadiusSize = 10;
    const double heightInk = 50;

    BorderRadius borderRadius =
        const BorderRadius.all(Radius.circular(borderRadiusSize));

    return Material(
      color: widget.color,
      borderRadius: borderRadius,
      child: Ink(
        height: heightInk,
        decoration: BoxDecoration(borderRadius: borderRadius),
        child: InkWell(
          onTap: () {
            setState(() {
              log("Button");
            });
          },
          child: Center(
            child: Text(widget.content,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                    color: widget.fontColor,
                    fontSize: FontSize.kFontSize24)),
          ),
        ),
      ),
    );
  }
}
