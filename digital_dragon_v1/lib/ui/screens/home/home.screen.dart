import 'dart:core';

import 'package:digital_dragon_v1/constants/base_url.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/hooks/use-characters.hook.dart';
import 'package:digital_dragon_v1/hooks/use-user.hook.dart';
import 'package:digital_dragon_v1/hooks/user-campaing.hook.dart';
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
  List<dynamic> characters = [];
  List<dynamic> campaigns = [];
  var _getUser;

  @override
  void initState() {
    super.initState();
    _getUser = getUser();
  }

  Future<List<Widget>> getUser() async {
    globals.userData = await getUserInfos(email: globals.email);

    var charactersResponse = await getCharacters(email: globals.email);
    characters = charactersResponse
        .map((character) => CharacterModel(
              name: character["name"],
              image: character["image"],
              id: character["id"],
              campaign: character["campaign"],
            ))
        .toList();

    var campaignsResponse = await getCampaigns(email: globals.email);
    campaigns = campaignsResponse
        .map((campaign) => CampaignModel(
              name: campaign["name"],
              image: campaign["image"],
              id: campaign["id"],
            ))
        .toList();

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
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: ColorsApp.kPrimaryColor,
                ),
              ),
            );
          }
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
