import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/constants/type_home_screen.dart';
import 'package:digital_dragon_v1/model/campaign-representation.model.dart';
import 'package:digital_dragon_v1/ui/screens/home/components/card-item-carousel.component.dart';
import 'package:digital_dragon_v1/ui/screens/home/shards/create-button/create-button.component.dart';
import 'package:flutter/material.dart';
import 'package:digital_dragon_v1/context/globals.dart' as globals;

class MasterHome extends StatefulWidget {
  const MasterHome({Key? key, required this.campaigns}) : super(key: key);
  final List<CampaignModel> campaigns;

  @override
  State<MasterHome> createState() => _MasterHomeState();
}

class _MasterHomeState extends State<MasterHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(globals.userData.image),
          radius: 35,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: Sizes.heigth(context) * .4,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: widget.campaigns.map((campaign) {
            return Builder(
              builder: (BuildContext context) {
                return CardItemCarousel(
                  id: campaign.id,
                  name: campaign.name,
                  image: campaign.image,
                  navigateTo: TypeHome.MASTER,
                );
              },
            );
          }).toList(),
        ),
        const CreateButton(navigateTo: 'campaign'),
      ],
    );
  }
}
