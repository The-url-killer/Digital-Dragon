class CampaignScreenModel {
  String id;
  List<dynamic> characters;
  String image;
  String lore;
  String master;
  List<dynamic> monsters;
  String name;
  List<dynamic> notes;
  List<dynamic> npcs;
  List<dynamic> places;

  CampaignScreenModel({
    required this.id,
    required this.characters,
    required this.image,
    required this.lore,
    required this.master,
    required this.monsters,
    required this.name,
    required this.notes,
    required this.npcs,
    required this.places,
  });
}
