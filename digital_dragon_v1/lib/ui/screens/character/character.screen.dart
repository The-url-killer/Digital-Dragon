import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/hooks/use-characters.hook.dart';
import 'package:digital_dragon_v1/model/character-model-screen-representation.model.dart';
import 'package:digital_dragon_v1/ui/components/drawer-item.component.dart';
import 'package:digital_dragon_v1/ui/resources/character_icon_icons.dart';
import 'package:digital_dragon_v1/ui/resources/master_icons_icons.dart';
import 'package:digital_dragon_v1/ui/screens/anotations/anotations.screen.dart';
import 'package:digital_dragon_v1/ui/screens/anotations/create-note.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/alies/add-alies.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/alies/alies.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/character-home/character-home.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/create-item/create-item.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/itens/itens.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/peronality-traces/personality-traces.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/pets/pets.screen.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/skill/skill.screen.dart';
import 'package:digital_dragon_v1/ui/screens/dices/dices.screen.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  CharacterScreen({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int _selectedIndex = 0;
  int _selectedWidgetMenu = 0;
  late CharacterModelScreen _characterModel;
  var _getCharacter;
  List<Widget>? _widgets = [];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Widget> _renderWidgetsMenu = [];

  void _onItemTapped(int index) {
    if (index == 3) {
      _drawerKey.currentState?.openDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _getCharacter = getCharacter();
  }

  Widget renderWidget(index) {
    return _renderWidgetsMenu[index];
  }

  getCharacter() async {
    _characterModel = await getCharactersInfo(id: widget.id);

    _renderWidgetsMenu = [
      PersonalityTraces(
          conections: _characterModel.connections,
          defects: _characterModel.defects,
          ideas: _characterModel.ideas,
          lore: _characterModel.lore,
          personalityTraces: _characterModel.personalityTrails),
      Alies(
        alies: _characterModel.alies,
      ),
      PetsScreen(pets: _characterModel.pets),
      const Dices(),
      Anotations(
        anotations: _characterModel.notes,
      )
    ];

    _widgets = [
      CharacterHomeScreen(characterModelScreen: _characterModel),
      SkillScreen(skills: _characterModel.speels!),
      ItensScreen(itens: _characterModel.itens!, money: _characterModel.money),
      renderWidget(_selectedWidgetMenu)
    ];

    return "heloo";
  }

  renderFloating() {
    if (_selectedIndex == 1) {
      return true;
    } else if (_selectedIndex == 2) {
      return true;
    } else if (_selectedIndex == 3) {
      if (_selectedWidgetMenu == 0 || _selectedWidgetMenu == 3) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCharacter(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: ColorsApp.kPrimaryColor,
              ),
            ),
          );
        }

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
                    description: "Lore",
                    icon: CharacterIcon.lore_icon,
                    onClick: () {
                      setState(() {
                        _selectedWidgetMenu = 0;
                        _selectedIndex = 3;
                        _drawerKey.currentState?.openEndDrawer();
                      });
                    },
                    isSelected: _selectedWidgetMenu == 0 && _selectedIndex == 3,
                  ),
                  DrawerItem(
                    description: "Aliados",
                    icon: MasterIcons.character_icon,
                    onClick: () {
                      setState(() {
                        _selectedWidgetMenu = 1;
                        _selectedIndex = 3;
                        _drawerKey.currentState?.openEndDrawer();
                      });
                    },
                    isSelected: _selectedWidgetMenu == 1 && _selectedIndex == 3,
                  ),
                  DrawerItem(
                    description: "Pets",
                    icon: CharacterIcon.pets_icon,
                    onClick: () {
                      setState(() {
                        _selectedWidgetMenu = 2;
                        _selectedIndex = 3;
                        _drawerKey.currentState?.openEndDrawer();
                      });
                    },
                    isSelected: _selectedWidgetMenu == 2 && _selectedIndex == 3,
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
                    isSelected: _selectedWidgetMenu == 3 && _selectedIndex == 3,
                  ),
                  DrawerItem(
                    description: "Notas",
                    icon: MasterIcons.notes_icon,
                    onClick: () {
                      setState(() {
                        _selectedWidgetMenu = 4;
                        _selectedIndex = 3;
                        _drawerKey.currentState?.openEndDrawer();
                      });
                    },
                    isSelected: _selectedWidgetMenu == 4 && _selectedIndex == 3,
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
                    MasterIcons.npc_icon,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    CharacterIcon.skills_icon,
                  ),
                  label: "Skills"),
              BottomNavigationBarItem(
                  icon: Icon(
                    CharacterIcon.itens_icon,
                  ),
                  label: "itens"),
              BottomNavigationBarItem(
                  icon: Icon(
                    MasterIcons.menu_icon,
                  ),
                  label: "Menu"),
            ],
          ),
          floatingActionButton: renderFloating()
              ? FloatingActionButton(
                  onPressed: () {
                    if (_selectedIndex == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CreateItem(
                                    id: widget.id,
                                  )));
                    }
                    if (_selectedIndex == 3) {
                      switch (_selectedWidgetMenu) {
                        case 2:
                          Navigator.push(
                              _,
                              MaterialPageRoute(
                                  builder: (_) => AddAliesScreen(
                                      id: widget.id, type: "Allies")));
                          break;
                        case 4:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      CreateNote(id: widget.id, type: "")));
                      }
                    }
                  },
                  backgroundColor: ColorsApp.kPrimaryColor,
                  child: const Icon(Icons.add),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
