class CampaignCharacterModel {
  String id;
  String name;
  String image;
  String aClass;
  String level;

  CampaignCharacterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.aClass,
    this.level = "1",
  });
}
