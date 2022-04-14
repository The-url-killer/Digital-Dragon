import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/ui/components/character.component.dart';
import 'package:flutter/cupertino.dart';

class MonsterCampaign extends StatefulWidget {
  MonsterCampaign({Key? key, required this.monsters}) : super(key: key);

  List<CampaignCharacterModel> monsters;

  @override
  State<MonsterCampaign> createState() => _MonsterCampaignState();
}

class _MonsterCampaignState extends State<MonsterCampaign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.monsters
              .map((character) => Character(character: character))
              .toList(),
        ));
  }
}
