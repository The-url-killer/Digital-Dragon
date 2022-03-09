class CharacterModel {
  String id;
  String image;
  String name;
  late String campaign;

  CharacterModel(
      {required this.id, required this.image, required this.name, this.campaign = ""});
}
