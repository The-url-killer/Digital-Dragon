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
  List<dynamic> alies;
  List<dynamic> pets;
  List<dynamic> notes;
  String lore;
  String defects;
  String personalityTrails;
  String connections;
  String ideas;
  String hair;
  double height;
  String tendency;
  String name;
  String peel;
  String race;
  List<dynamic>? speels;
  List<dynamic>? itens;
  String user;

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
    required this.campaign,
    required this.expertises,
    required this.hair,
    required this.height,
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
    required this.itens,
    required this.speels,
    required this.user,
  });
}
