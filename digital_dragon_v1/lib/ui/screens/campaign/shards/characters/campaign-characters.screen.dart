import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/ui/components/character.component.dart';
import 'package:flutter/cupertino.dart';

class CharacterCampaign extends StatefulWidget {
  CharacterCampaign({Key? key, required this.characters}) : super(key: key);

  List<dynamic> characters;

  @override
  State<CharacterCampaign> createState() => _CharacterCampaignState();
}

class _CharacterCampaignState extends State<CharacterCampaign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.characters
              .map((character) => Character(character: character))
              .toList(),
        ));
  }
}
