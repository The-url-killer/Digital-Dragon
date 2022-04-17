import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/model/item.model.dart';
import 'package:digital_dragon_v1/model/spell.model.dart';

class CharacterModelScreen {
  String id;
  String aClass;
  String image;
  int age;
  int ca;
  int lifePoints;
  int speed;
  int level;
  Map<String, int> atributes;
  Map<String, int> money;
  String campaign;
  Map<String, bool> expertises;
  List<CampaignCharacterModel> alies;
  List<CampaignCharacterModel> pets;
  List<String> notes;
  String lore;
  String defects;
  String personalityTrails;
  String connections;
  String ideas;
  String hair;
  double heigth;
  String tendency;
  String name;
  String peel;
  String race;
  List<Skill>? speels;
  List<Item>? itens;

  CharacterModelScreen({
    required this.id,
    required this.aClass,
    required this.age,
    required this.atributes,
    required this.money,
    required this.image,
    required this.ca,
    required this.level,
    required this.lifePoints,
    required this.speed,
    this.campaign = '',
    required this.expertises,
    required this.hair,
    required this.heigth,
    required this.tendency,
    required this.name,
    required this.alies,
    required this.peel,
    required this.race,
    required this.lore,
    required this.defects,
    required this.personalityTrails,
    required this.connections,
    required this.ideas,
    required this.notes,
    required this.pets,
    this.itens,
    this.speels,
  });
}
