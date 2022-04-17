import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:flutter/material.dart';

typedef HandleOnClick = void Function();

class DrawerItem extends StatelessWidget {
  DrawerItem({
    Key? key,
    required this.description,
    required this.icon,
    required this.onClick,
    required this.isSelected,
  }) : super(key: key);

  final String description;
  final IconData icon;
  final HandleOnClick onClick;
  final double heigth = 20;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    Color color = isSelected ? ColorsApp.kPrimaryColor : ColorsApp.kBlack;
    TextStyle style = TextStyle(
      fontSize: FontSize.kFontSize18,
      fontWeight: FontWeight.bold,
      color: color,
    );

    return Material(
      child: Ink(
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: heigth,
                  color: color,
                ),
                const SizedBox(width: 20),
                Text(description, style: style),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
