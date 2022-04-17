import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/ui/components/character.component.dart';
import 'package:digital_dragon_v1/ui/screens/info/info.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alies extends StatefulWidget {
  Alies({Key? key, required this.alies}) : super(key: key);

  List<CampaignCharacterModel> alies;

  @override
  State<Alies> createState() => _AliesState();
}

class _AliesState extends State<Alies> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.alies
              .map((ally) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Info(character: ally),
                      ),
                    );
                  },
                  child: Character(character: ally)))
              .toList(),
        ));
    ;
  }
}
