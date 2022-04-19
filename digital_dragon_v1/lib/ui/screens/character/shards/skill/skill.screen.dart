import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/model/spell.model.dart';
import 'package:flutter/material.dart';

class SkillScreen extends StatefulWidget {
  SkillScreen({Key? key, required this.skills}) : super(key: key);

  List<dynamic> skills;

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  TextStyle titleStyle = const TextStyle(
      color: ColorsApp.kPrimaryColor, fontSize: FontSize.kFontSize18);
  late List<bool> opened;

  @override
  void initState() {
    super.initState();

    opened = widget.skills.map((item) => false).toList();
  }

  @override
  Widget build(BuildContext context) {
    List skills = Iterable<int>.generate(widget.skills.length).toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: skills
              .map(
                (skill) => InkWell(
                  onTap: () {
                    setState(() {
                      opened[skill] = !opened[skill];
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorsApp.kBlack, width: 1),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.skills[skill].name,
                              style: titleStyle,
                            ),
                            Text(
                              widget.skills[skill].level.toString(),
                              style: titleStyle,
                            )
                          ],
                        ),
                        SizedBox(height: opened[skill] ? 12 : 0),
                        Text(opened[skill]
                            ? widget.skills[skill].description
                            : ""),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
