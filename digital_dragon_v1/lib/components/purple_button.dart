import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class PurpleButton extends StatelessWidget {
  const PurpleButton(this.content, {Key? key}) : super(key: key);

  final String content;

  final TextStyle textStyle = const TextStyle();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(content),
      ),
    );
  }
}
