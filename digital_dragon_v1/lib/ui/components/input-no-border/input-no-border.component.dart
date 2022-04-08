import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputNoBorder extends StatelessWidget {
  const InputNoBorder({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      color: ColorsApp.kBlack,
      fontSize: FontSize.kFontSize24,
      fontWeight: FontWeight.bold,
    );

    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      style: style,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: style,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
