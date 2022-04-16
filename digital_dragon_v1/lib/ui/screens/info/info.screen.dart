import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-place-representation.model.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  Info({Key? key, this.character, this.placeModel}) : super(key: key);

  CampaignCharacterModel? character;
  CampaignPlaceModel? placeModel;

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    String? image = widget.character == null
        ? widget.placeModel?.image
        : widget.character?.image;

    String? lore = widget.character == null
        ? widget.placeModel?.lore
        : widget.character?.lore;

    String? name = widget.character == null
        ? widget.placeModel?.name
        : widget.character?.name;

    double heigthImage = Sizes.heigth(context) * 0.45;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: heigthImage,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorsApp.kWhite05,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: heigthImage - 40,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorsApp.kWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(fontSize: FontSize.kFontSize30),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    lore!,
                    style: const TextStyle(
                        fontSize: FontSize.kFontSize18,
                        fontWeight: FontWeight.w100),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
