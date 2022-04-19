import 'package:digital_dragon_v1/constants/base_url.dart';
import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-place-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-screen-representation.model.dart';
import 'package:dio/dio.dart';

const baseUrl = BaseUrl.baseUrl + "/campaign/";

getCampaigns({email}) async {
  Response<dynamic> response =
      await Dio().get(baseUrl + "get-campaigns/" + email);

  return response.data;
}

createCampaign({name, image, email, history}) async {
  Response<dynamic> response = await Dio().post(baseUrl + "create",
      data: {"name": name, "image": image, "email": email, "history": history});
  return response.data;
}

getCampaignInfo({id}) async {
  Response<dynamic> response = await Dio().get(baseUrl + id);
  var campaign = response.data;
  print(campaign);
  var monsters = campaign["monsters"]
      .map((monster) => CampaignCharacterModel(
          id: monster["id"],
          name: monster["name"],
          image: monster["image"],
          aClass: "Bárbaro",
          lore: monster["lore"]))
      .toList();
  var npcs = campaign["npcs"]
      .map((npc) => CampaignCharacterModel(
          id: npc["id"],
          name: npc["name"],
          image: npc["image"],
          aClass: "ferreiro",
          lore: npc["lore"]))
      .toList();
  var places = campaign["places"]
      .map((place) => CampaignPlaceModel(
          id: place["id"],
          name: place["name"],
          image: place["image"],
          lore: place["lore"]))
      .toList();
  var characters = campaign["characters"]
      .map((npc) => CampaignCharacterModel(
          id: npc["id"],
          name: npc["name"],
          image: npc["image"],
          aClass: "Guerreiro",
          lore: npc["lore"]))
      .toList();

  return CampaignScreenModel(
      id: campaign["id"],
      characters: characters,
      image: campaign["image"],
      lore: campaign["lore"],
      master: campaign["master"],
      monsters: monsters,
      name: campaign["name"],
      notes: campaign["notes"],
      npcs: npcs,
      places: places);
}

createNote({text, id, type}) async {
  Response<dynamic> response = await Dio().post(baseUrl + "create-note",
      data: {"text": text, "id": id, "type": type});
  return response.data;
}

createNpc({name, image, id, lore, level, aClass}) async {
  Response<dynamic> response = await Dio().post(baseUrl + "create-npc",
      data: {name, image, id, lore, level, aClass});
  return response.data;
}
