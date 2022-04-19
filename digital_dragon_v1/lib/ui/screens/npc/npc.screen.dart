import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/ui/components/character.component.dart';
import 'package:digital_dragon_v1/ui/screens/info/info.screen.dart';
import 'package:flutter/material.dart';

class Npc extends StatefulWidget {
  Npc({Key? key, required this.npcs}) : super(key: key);

  List<dynamic> npcs;

  @override
  State<Npc> createState() => _NpcState();
}

class _NpcState extends State<Npc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.npcs
              .map((npc) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Info(character: npc),
                      ),
                    );
                  },
                  child: Character(character: npc)))
              .toList(),
        ));
  }
}
