import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_dragon_v1/model/character-representation.model.dart';
import 'package:digital_dragon_v1/ui/screens/home/components/card-item-carousel.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeJogador extends StatelessWidget {
  const HomeJogador({Key? key, required this.characters}) : super(key: key);

  final List<CharacterModel> characters;

  List<Widget> renderCharacters() {
    return characters.map((character) => Text(character.name)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: characters.map((character) {
        return Builder(
          builder: (BuildContext context) {
            return CardItemCarousel(
              name: character.name,
              image: character.image,
              subTitle: character.campaign,
            );
          },
        );
      }).toList(),
    );
  }
}
