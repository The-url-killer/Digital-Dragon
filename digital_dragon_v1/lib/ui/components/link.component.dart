import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  const Link({Key? key, required this.content, required this.onClick})
      : super(key: key);

  final String content;
  final dynamic onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Text(
        content,
        style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: FontSize.kFontSize14,
            color: ColorsApp.kPrimaryColor),
      ),
    );
  }
}
