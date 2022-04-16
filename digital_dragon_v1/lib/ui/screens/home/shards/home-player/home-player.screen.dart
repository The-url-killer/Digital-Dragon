import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/constants/type_home_screen.dart';
import 'package:digital_dragon_v1/model/character-representation.model.dart';
import 'package:digital_dragon_v1/ui/screens/home/components/card-item-carousel.component.dart';
import 'package:digital_dragon_v1/context/globals.dart' as globals;
import 'package:digital_dragon_v1/ui/screens/home/shards/create-button/create-button.component.dart';
import 'package:flutter/material.dart';

class HomePlayer extends StatelessWidget {
  const HomePlayer({Key? key, required this.characters}) : super(key: key);

  final List<CharacterModel> characters;

  dynamic renderText() {
    if (globals.userData.image == "") {
      return Text(
        globals.userData.name.split(' ')[0][0].toUpperCase() +
            globals.userData.name.split(' ')[1][0].toUpperCase(),
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      );
    }
    return Container(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(globals.userData.image),
          backgroundColor: ColorsApp.kPrimaryColor,
          radius: 35,
          child: renderText(),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: Sizes.heigth(context) * .4,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: characters.map((character) {
            return Builder(
              builder: (BuildContext context) {
                return CardItemCarousel(
                  id: character.id,
                  name: character.name,
                  image: character.image,
                  subTitle: character.campaign,
                  navigateTo: TypeHome.PLAYER,
                );
              },
            );
          }).toList(),
        ),
        const CreateButton(navigateTo: 'character'),
      ],
    );
  }
}
