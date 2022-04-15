import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-place-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-screen-representation.model.dart';
import 'package:digital_dragon_v1/ui/resources/master_icons_icons.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/hook.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/shards/characters/campaign-characters.screen.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/shards/home/campaign-home.screen.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/shards/monsters/campaign-monsters.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Campaign extends StatefulWidget {
  const Campaign({Key? key}) : super(key: key);

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  int _selectedIndex = 0;
  late CampaignScreenModel _campaignModel;
  var _getCampaign;
  List<Widget>? _widgets = [];
  String? id;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getCampaign(id) async {
    _campaignModel = await getCampaignInfo(id);

    return <Widget>[
      HomeCampaign(
        image: _campaignModel.image,
        name: _campaignModel.name,
        lore: _campaignModel.lore,
      ),
      CharacterCampaign(characters: _campaignModel.characters),
      MonsterCampaign(monsters: _campaignModel.monsters),
    ];
  }

  @override
  void initState() {
    super.initState();

    if (id != null) {
      _getCampaign = getCampaign(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as String;

    return FutureBuilder(
        future: getCampaign(id),
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
          _widgets = snapshot.data as List<Widget>?;

          return Scaffold(
            body: _widgets!.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.home_icon,
                      size: 18,
                      color: _selectedIndex == 0
                          ? ColorsApp.kPrimaryColor
                          : ColorsApp.kBlack,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.character_icon,
                      size: 18,
                      color: _selectedIndex == 1
                          ? ColorsApp.kPrimaryColor
                          : ColorsApp.kBlack,
                    ),
                    label: "Personagem"),
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.monster_icon,
                      size: 18,
                      color: _selectedIndex == 2
                          ? ColorsApp.kPrimaryColor
                          : ColorsApp.kBlack,
                    ),
                    label: "Monstros"),
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.menu_icon,
                      size: 18,
                      color: _selectedIndex == 3
                          ? ColorsApp.kPrimaryColor
                          : ColorsApp.kBlack,
                    ),
                    label: "Menu"),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: ColorsApp.kPrimaryColor,
              onTap: _onItemTapped,
              elevation: 1,
            ),
            floatingActionButton: _selectedIndex == 1 || _selectedIndex == 2
                ? FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.createCampaign);
                    },
                    backgroundColor: ColorsApp.kPrimaryColor,
                    child: const Icon(Icons.add),
                  )
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        });
  }
}
