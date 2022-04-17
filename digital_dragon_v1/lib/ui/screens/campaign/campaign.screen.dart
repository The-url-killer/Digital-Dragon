import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/model/campaign-screen-representation.model.dart';
import 'package:digital_dragon_v1/ui/components/drawer-item.component.dart';
import 'package:digital_dragon_v1/ui/resources/master_icons_icons.dart';
import 'package:digital_dragon_v1/ui/screens/anotations/anotations.screen.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/hook.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/shards/characters/campaign-characters.screen.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/shards/home/campaign-home.screen.dart';
import 'package:digital_dragon_v1/ui/screens/campaign/shards/monsters/campaign-monsters.screen.dart';
import 'package:digital_dragon_v1/ui/screens/dices/dices.screen.dart';
import 'package:digital_dragon_v1/ui/screens/npc/npc.screen.dart';
import 'package:digital_dragon_v1/ui/screens/places/places.screen.dart';
import 'package:flutter/material.dart';

class Campaign extends StatefulWidget {
  const Campaign({Key? key}) : super(key: key);

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  int _selectedIndex = 0;
  int _selectedWidgetMenu = 0;
  late CampaignScreenModel _campaignModel;
  var _getCampaign;
  List<Widget>? _widgets = [];
  String? id;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Widget> _renderWidgetsMenu = [];

  Widget renderWidget(index) {
    return _renderWidgetsMenu[index];
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      _drawerKey.currentState?.openDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  getCampaign(id) async {
    _campaignModel = await getCampaignInfo(id);

    _renderWidgetsMenu = [
      Npc(npcs: _campaignModel.npcs),
      Places(places: _campaignModel.places),
      Anotations(anotations: _campaignModel.notes),
      const Dices(),
    ];

    return <Widget>[
      HomeCampaign(
        image: _campaignModel.image,
        name: _campaignModel.name,
        lore: _campaignModel.lore,
      ),
      CharacterCampaign(characters: _campaignModel.characters),
      MonsterCampaign(monsters: _campaignModel.monsters),
      renderWidget(_selectedWidgetMenu),
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
            key: _drawerKey,
            body: _widgets!.elementAt(_selectedIndex),
            drawer: Drawer(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DrawerItem(
                      description: "NPCs",
                      icon: MasterIcons.npc_icon,
                      onClick: () {
                        setState(() {
                          _selectedWidgetMenu = 0;
                          _selectedIndex = 3;
                          _drawerKey.currentState?.openEndDrawer();
                        });
                      },
                      isSelected: _selectedWidgetMenu == 0,
                    ),
                    DrawerItem(
                      description: "Locais",
                      icon: MasterIcons.places_icon,
                      onClick: () {
                        setState(() {
                          _selectedWidgetMenu = 1;
                          _selectedIndex = 3;
                          _drawerKey.currentState?.openEndDrawer();
                        });
                      },
                      isSelected: _selectedWidgetMenu == 1,
                    ),
                    DrawerItem(
                      description: "Notas",
                      icon: MasterIcons.notes_icon,
                      onClick: () {
                        setState(() {
                          _selectedWidgetMenu = 2;
                          _selectedIndex = 3;
                          _drawerKey.currentState?.openEndDrawer();
                        });
                      },
                      isSelected: _selectedWidgetMenu == 2,
                    ),
                    DrawerItem(
                      description: "Dados",
                      icon: MasterIcons.dices_icon,
                      onClick: () {
                        setState(() {
                          _selectedWidgetMenu = 3;
                          _selectedIndex = 3;
                          _drawerKey.currentState?.openEndDrawer();
                        });
                      },
                      isSelected: _selectedWidgetMenu == 3,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              currentIndex: _selectedIndex,
              selectedItemColor: ColorsApp.kPrimaryColor,
              unselectedItemColor: ColorsApp.kBlack,
              onTap: _onItemTapped,
              elevation: 1,
              iconSize: 22,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.home_icon,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.character_icon,
                    ),
                    label: "Personagem"),
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.monster_icon,
                    ),
                    label: "Monstros"),
                BottomNavigationBarItem(
                    icon: Icon(
                      MasterIcons.menu_icon,
                    ),
                    label: "Menu"),
              ],
            ),
            floatingActionButton: _selectedIndex == 1 ||
                    _selectedIndex == 2 ||
                    (_selectedIndex == 3 && _selectedWidgetMenu != 3)
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
