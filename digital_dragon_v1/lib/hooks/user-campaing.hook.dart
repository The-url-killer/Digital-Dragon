import 'package:digital_dragon_v1/constants/base_url.dart';
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
  return CampaignScreenModel(id: campaign["id"], characters: campaign["characters"], image: campaign["image"], lore: campaign["lore"], master: campaign["master"], monsters: campaign["monsters"], name: campaign["name"], notes: campaign["notes"], npcs: campaign["npcs"], places: campaign["places"]);
}

createNote({text, id, type}) async {
  Response<dynamic> response = await Dio().post(
      baseUrl + "create-note",
      data: {"text": text, "id": id, "type": type});
  return response.data;
}
