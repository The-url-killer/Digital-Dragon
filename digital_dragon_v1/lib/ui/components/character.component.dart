import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  const Character({Key? key, required this.character}) : super(key: key);

  final CampaignCharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Material(
        child: Ink(
          child: InkWell(
            child: Container(
              height: 100,
              width: Sizes.width(context) * 0.9,
              padding: const EdgeInsets.fromLTRB(12, 20, 20, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: ColorsApp.kBlack,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(32)),
                        child: SizedBox(
                          height: 64,
                          width: 64,
                          child: Image.network(
                            character.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character.name,
                            textAlign: TextAlign.start,
                            style:
                                const TextStyle(fontSize: FontSize.kFontSize18),
                          ),
                          Text(
                            character.aClass,
                            textAlign: TextAlign.start,
                            style:
                                const TextStyle(fontSize: FontSize.kFontSize14),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    character.level.toString(),
                    style: const TextStyle(fontSize: FontSize.kFontSize36),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
