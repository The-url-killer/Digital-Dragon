import 'package:digital_dragon_v1/constants/base_url.dart';
import 'package:digital_dragon_v1/model/character-model-screen-representation.model.dart';
import 'package:digital_dragon_v1/model/item.model.dart';
import 'package:digital_dragon_v1/model/spell.model.dart';
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
  var itens = character["itens"]
      .map((item) => Item(
            id: item["id"],
            name: item["name"],
            price: item["price"],
            size: item["size"],
            typeEquipment: item["typeEquipment"],
            armorClass: item["armorClass"],
            damage: item["damage"],
            description: item["description"],
            desStealth: item["desStealth"],
            strength: item["strength"],
            weaponClass: item["weaponClass"],
          ))
      .toList();
  var spells = character["speels"]
      .map((speel) => Skill(
          name: speel["name"],
          castTime: speel["castTime"],
          classes: speel["classes"],
          component: speel["component"],
          description: speel["description"],
          duration: speel["duration"],
          level: speel["level"],
          range: speel["range"],
          school: speel["school"]))
      .toList();

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
    itens: itens,
    speels: spells,
  );
}

createAllie({name, image, id, history, level}) async {
  Response<dynamic> response = await Dio().post(
      BaseUrl.baseUrl + "/create-allie",
      data: {name, image, id, history, level});
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
    "name": name,
    "price": price,
    "size": size,
    "typeEquipment": typeEquipment,
    "description": description,
    "damage": damage,
    "weaponClass": weaponClass,
    "desStealth": desStealth,
    "armorClass": armorClass,
    "strength": strength,
    "id": id
  });
  return response.data;
}

create({
  required classe,
  required age,
  required atributes,
  required expertises,
  required hair,
  required height,
  required tendency,
  required name,
  required peel,
  required race,
  required image,
  required campaign,
  required connections,
  required defects,
  required lore,
  required ideas,
  required personalityTrails,
  required email,
}) async {
  Response<dynamic> response =
      await Dio().post(BaseUrl.baseUrl + "/create", data: {
    "classe": classe,
    "age": age,
    "atributes": atributes,
    "expertises": expertises,
    "hair": hair,
    "heigth": height,
    "tendency": tendency,
    "name": name,
    "peel": peel,
    "email": email,
    "personalityTrails": personalityTrails,
    "image": image,
    "lore": lore,
    "ideas": ideas,
    "defects": defects,
    "connections": connections,
    "race": race,
    "campaign": campaign,
  });
  return response;
}
