import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/model/campaign-representation.model.dart';
import 'package:digital_dragon_v1/ui/screens/home/components/card-item-carousel.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterHome extends StatefulWidget {
  const MasterHome({Key? key, required this.campaigns}) : super(key: key);
  final List<CampaignModel> campaigns;

  @override
  State<MasterHome> createState() => _MasterHomeState();
}

class _MasterHomeState extends State<MasterHome> {
  getUser() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('user');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CarouselSlider(
            options: CarouselOptions(
              height: Sizes.heigth(context) * .5,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: widget.campaigns.map((campaign) {
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
      },
    );
  }
}
