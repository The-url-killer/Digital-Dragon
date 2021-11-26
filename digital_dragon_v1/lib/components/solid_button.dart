import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef HandleOnClick = void Function();

class SolidButton extends StatefulWidget {
  SolidButton(this.content, this.color, this.fontColor, this.onTap, {Key? key})
      : super(key: key);

  final String content;
  final Color color;
  Color fontColor = ColorsApp.kWhite;
  final HandleOnClick onTap;

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
          borderRadius: borderRadius,
          onTap: () {
            widget.onTap();
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
