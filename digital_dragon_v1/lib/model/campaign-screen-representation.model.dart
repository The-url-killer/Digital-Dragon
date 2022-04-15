import 'campaign-character-representation.model.dart';
import 'campaign-place-representation.model.dart';

class CampaignScreenModel {

  List<CampaignCharacterModel> characters;
  String image;
  String lore;
  String master;
  List<CampaignCharacterModel> monsters;
  String name;
  List<String> notes;
  List<CampaignCharacterModel> npcs;
  List<CampaignPlaceModel> places;

  CampaignScreenModel({
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
