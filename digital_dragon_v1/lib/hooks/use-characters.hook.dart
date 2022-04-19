import 'package:digital_dragon_v1/constants/base_url.dart';
import 'package:digital_dragon_v1/model/character-model-screen-representation.model.dart';
import 'package:dio/dio.dart';

getCharacters({email}) async {
  Response<dynamic> response =
      await Dio().get(BaseUrl.baseUrl + "/get-characters/" + email);

  return response.data;
}

getCharactersInfo({id}) async {
  Response<dynamic> response =
      await Dio().get(BaseUrl.baseUrl + "/get-character/" + id);
  dynamic character = response.data;
  Map<String, int> stats = {
    "strength": character["atributes"]["strength"],
    "dextery": character["atributes"]["dextery"],
    "constituation": character["atributes"]["constituation"],
    "inteligence": character["atributes"]["inteligence"],
    "winsdom": character["atributes"]["winsdom"],
    "carism": character["atributes"]["carism"]
  };
  Map<String, bool> expertises = {
    "acrobatics": character["expertises"]["acrobatics"],
    "atletism": character["expertises"]["atletism"],
    "speach": character["expertises"]["speach"],
    "atuation": character["expertises"]["atuation"],
    "history": character["expertises"]["history"],
    "intuitc": character["expertises"]["intuitc"],
    "intimidation": character["expertises"]["intimidation"],
    "investigation": character["expertises"]["investigation"],
    "medicine": character["expertises"]["medicine"],
    "nature": character["expertises"]["nature"],
    "perception": character["expertises"]["perception"],
    "persuasion": character["expertises"]["persuasion"],
    "religion": character["expertises"]["religion"],
    "sleight of hand": character["expertises"]["sleight of hand"],
    "stealth": character["expertises"]["stealth"],
    "survival": character["expertises"]["survival"],
    "arcanism": character["expertises"]["arcanism"],
    "animals": character["expertises"]["animals"],
  };
  Map<String, int> money = {
    "pp": character["money"]["pp"],
    "pc": character["money"]["pc"],
    "po": character["money"]["po"],
    "pe": character["money"]["pp"],
    "pl": character["money"]["pl"],
  };

  return CharacterModelScreen(
    id: character["id"],
    aClass: character["aclass"],
    age: character["age"],
    atributes: stats,
    money: money,
    image: character["image"],
    ca: character["ca"],
    level: character["level"],
    lifePoints: character["lifePoints"],
    speed: character["speed"],
    expertises: expertises,
    hair: character["hair"],
    height: character["height"],
    tendency: character["tendency"],
    name: character["name"],
    alies: character["alies"],
    peel: character["peel"],
    race: character["race"],
    lore: character["lore"],
    defects: character["defects"],
    personalityTrails: character["personalityTrails"],
    connections: character["connections"],
    ideas: character["ideas"],
    notes: character["notes"],
    pets: character["pets"],
    user: character["user"],
    campaign: character["campaign"],
    itens: character["itens"],
    speels: character["speels"],
  );
}

createAllie({name, image, id, history, level}) async {
  Response<dynamic> response = await Dio().post(
      BaseUrl.baseUrl + "/create-allie",
      data: {name, image, id, history, level});
  return response.data;
}

createMonster({name, image, id, lore, level, aClass}) async {
  Response<dynamic> response =
      await Dio().post(BaseUrl.baseUrl + "/create-monster", data: {
    "name": name,
    "image": image,
    "id": id,
    "lore": lore,
    "level": level,
    "race": aClass
  });
  return response.data;
}

createNpc({name, image, id, lore, level, aclass}) async {
  Response<dynamic> response = await Dio().post(BaseUrl.baseUrl + "/create-npc",
      data: {name, image, id, lore, level});
  return response.data;
}

createItem(
    {name,
    price,
    size,
    typeEquipment,
    description,
    damage,
    weaponClass,
    desStealth,
    armorClass,
    strength,
    id}) async {
  Response<dynamic> response =
      await Dio().post(BaseUrl.baseUrl + "/create-item", data: {
    name,
    price,
    size,
    typeEquipment,
    description,
    damage,
    weaponClass,
    desStealth,
    armorClass,
    strength,
    id
  });
  return response.data;
}

craetePlace({name, image, lore, id}) async {
  Response<dynamic> response = await Dio()
      .post(BaseUrl.baseUrl + "/create-place", data: {name, image, lore, id});
  return response.data;
}
