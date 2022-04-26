// ignore_for_file: must_be_immutable

import 'package:digital_dragon_v1/ui/components/character.component.dart';
import 'package:digital_dragon_v1/ui/screens/info/info.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonsterCampaign extends StatefulWidget {
  MonsterCampaign({Key? key, required this.monsters}) : super(key: key);

  List<dynamic> monsters;

  @override
  State<MonsterCampaign> createState() => _MonsterCampaignState();
}

class _MonsterCampaignState extends State<MonsterCampaign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.monsters
                .map(
                  (character) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Info(character: character),
                          ),
                        );
                      },
                      child: Character(character: character)),
                )
                .toList(),
          ),
        ));
  }
}
