import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/material.dart';

class PersonalityTraces extends StatefulWidget {
  PersonalityTraces(
      {Key? key,
      required this.conections,
      required this.defects,
      required this.ideas,
      required this.lore,
      required this.personalityTraces})
      : super(key: key);

  String personalityTraces;
  String ideas;
  String conections;
  String defects;
  String lore;

  @override
  State<PersonalityTraces> createState() => _PersonalityTracesState();
}

class _PersonalityTracesState extends State<PersonalityTraces> {
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(
      fontSize: FontSize.kFontSize24,
      color: ColorsApp.kPrimaryColor,
    );
    TextStyle descriptionStyle = const TextStyle(
      fontSize: FontSize.kFontSize16,
      color: ColorsApp.kBlack,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: Sizes.width(context), height: 32),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorsApp.kBlack,
                width: 1,
              ),
            ),
            width: Sizes.width(context) * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Traços de Personalidade",
                  style: titleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.personalityTraces,
                  style: descriptionStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorsApp.kBlack,
                width: 1,
              ),
            ),
            width: Sizes.width(context) * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ideais",
                  style: titleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.ideas,
                  style: descriptionStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorsApp.kBlack,
                width: 1,
              ),
            ),
            width: Sizes.width(context) * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ligações",
                  style: titleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.conections,
                  style: descriptionStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorsApp.kBlack,
                width: 1,
              ),
            ),
            width: Sizes.width(context) * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Defeitos",
                  style: titleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.defects,
                  style: descriptionStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorsApp.kBlack,
                width: 1,
              ),
            ),
            width: Sizes.width(context) * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "História",
                  style: titleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.lore,
                  style: descriptionStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
