import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxButton extends StatefulWidget {
  BoxButton({Key? key, required this.onTap, required this.content})
      : super(key: key);

  void Function() onTap;
  String content;

  @override
  State<BoxButton> createState() => _BoxButtonState();
}

class _BoxButtonState extends State<BoxButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsApp.kPrimaryColor,
        ),
        width: Sizes.width(context) * .7,
        height: 85,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.search, size: 30, color: ColorsApp.kWhite),
            const SizedBox(width: 20),
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: FontSize.kFontSize24,
                color: ColorsApp.kWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
