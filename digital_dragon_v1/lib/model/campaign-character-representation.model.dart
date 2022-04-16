class CampaignCharacterModel {
  String id;
  String name;
  String image;
  String aClass;
  String level;
  String lore;

  CampaignCharacterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.aClass,
    this.level = "1",
    required this.lore,
  });
}
