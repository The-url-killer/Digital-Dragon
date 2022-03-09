import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_dragon_v1/model/campaign-representation.model.dart';
import 'package:digital_dragon_v1/ui/screens/home/components/card-item-carousel.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MasterHome extends StatelessWidget {
  const MasterHome({Key? key, required this.campaigns}) : super(key: key);

  final List<CampaignModel> campaigns;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: campaigns.map((campaign) {
        return Builder(
          builder: (BuildContext context) {
            return CardItemCarousel(
              name: campaign.name,
              image: campaign.image,
            );
          },
        );
      }).toList(),
    );
  }
}
