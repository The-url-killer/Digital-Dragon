import 'dart:core';

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/model/campaign-representation.model.dart';
import 'package:digital_dragon_v1/model/character-representation.model.dart';
import 'package:digital_dragon_v1/model/user-data.model.dart';
import 'package:digital_dragon_v1/ui/resources/app_icons.dart';
import 'package:digital_dragon_v1/ui/screens/home/shards/home-master/home-master.screen.dart';
import 'package:digital_dragon_v1/ui/screens/home/shards/home-player/home-player.screen.dart';
import 'package:digital_dragon_v1/context/globals.dart' as globals;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<CharacterModel> characters = [];
  List<CampaignModel> campaigns = [];
  var _getUser;

  @override
  void initState() {
    super.initState();

    _getUser = getUser();
  }

  Future<List<Widget>> getUser() async {
    globals.userData = UserData(
        email: 'diulianovargas@gmail.com',
        name: 'Diuliano Vargas',
        image:
            'https://i.pinimg.com/236x/de/39/6d/de396dfe059d817621a3788cd85fadeb.jpg');

    characters = [
      CharacterModel(
        id: "amvuinhad9u0n",
        image:
            "https://i.pinimg.com/236x/2c/79/45/2c794530c89045e526b5243663a34e7c.jpg",
        name: "Bjorn",
        campaign: "Ice Wind",
      ),
      CharacterModel(
        id: "5135321532amvuinhad9u0n",
        image:
            "https://i.pinimg.com/236x/2c/79/45/2c794530c89045e526b5243663a34e7c.jpg",
        name: "Cadian",
      ),
      CharacterModel(
        id: "amfadfafaeevuinhad9u0n",
        image:
            "https://i.pinimg.com/236x/2c/79/45/2c794530c89045e526b5243663a34e7c.jpg",
        name: "Renegardaaaaaa",
        campaign: "Ice Windaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      ),
    ];

    campaigns = [
      CampaignModel(
          id: "akdvmkoadmvkad",
          name: "Ice Wind",
          image:
              "https://i.pinimg.com/236x/de/39/6d/de396dfe059d817621a3788cd85fadeb.jpg"),
      CampaignModel(
          id: "kamdkvadkvda",
          name: "Veneguard",
          image:
              "https://i.pinimg.com/236x/de/39/6d/de396dfe059d817621a3788cd85fadeb.jpg"),
      CampaignModel(
          id: "kanmvkadkvodan",
          name: "Classica",
          image:
              "https://i.pinimg.com/236x/de/39/6d/de396dfe059d817621a3788cd85fadeb.jpg")
    ];

    return <Widget>[
      HomePlayer(characters: characters),
      MasterHome(campaigns: campaigns),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget>? _widgetOptions = [];

    return FutureBuilder(
        future: _getUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _widgetOptions = snapshot.data as List<Widget>?;
          }
          return Scaffold(
            body: Center(
              child: _widgetOptions!.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.player_icon, size: 22),
                  label: 'Jogador',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.master_icon, size: 22),
                  label: 'Mestre',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: ColorsApp.kPrimaryColor,
              onTap: _onItemTapped,
            ),
          );
        });
  }
}
