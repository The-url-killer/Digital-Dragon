import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_dragon_v1/model/character-representation.model.dart';
import 'package:digital_dragon_v1/ui/screens/home/components/card-item-carousel.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePlayer extends StatelessWidget {
  const HomePlayer({Key? key, required this.characters}) : super(key: key);

  final List<CharacterModel> characters;

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
