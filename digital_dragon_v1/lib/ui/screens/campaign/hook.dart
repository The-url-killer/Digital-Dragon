import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-place-representation.model.dart';
import 'package:digital_dragon_v1/model/campaign-screen-representation.model.dart';

getCampaignInfo(id) {
  return CampaignScreenModel(
    image:
        "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
    lore:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget pretium sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nunc mauris, commodo non nulla nec, eleifend cursus velit. Sed a interdum nibh. Aliquam vitae eleifend tellus, ac vestibulum.",
    name: "Ice Wind",
    notes: ["Jesus cristo", "Acaba logo", "Não sei o que fazer"],
    master: "diuliano.silveira@gmail.com",
    characters: [
      CampaignCharacterModel(
        id: "1",
        name: "Diuliano",
        aClass: "Barbarian",
        level: "1",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignCharacterModel(
        id: "2",
        name: "Diovane",
        aClass: "Mage",
        level: "3",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignCharacterModel(
        id: "3",
        name: "Gabriel",
        aClass: "Bard",
        level: "7",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
    ],
    monsters: [
      CampaignCharacterModel(
        id: "1",
        name: "Diuliano",
        aClass: "Barbarian",
        level: "1",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignCharacterModel(
        id: "2",
        name: "Diovane",
        aClass: "Mage",
        level: "3",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignCharacterModel(
        id: "3",
        name: "Gabriel",
        aClass: "Bard",
        level: "7",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
    ],
    npcs: [
      CampaignCharacterModel(
        id: "1",
        name: "Diuliano",
        aClass: "Barbarian",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignCharacterModel(
        id: "2",
        name: "Diovane",
        aClass: "Mage",
        level: "3",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignCharacterModel(
        id: "3",
        name: "Gabriel",
        aClass: "Bard",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
    ],
    places: [
      CampaignPlaceModel(
        id: "1",
        name: "Place 1",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignPlaceModel(
        id: "1",
        name: "Place 1",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      ),
      CampaignPlaceModel(
        id: "1",
        name: "Place 1",
        image:
            "https://i.pinimg.com/564x/59/65/f3/5965f35451361de3855bf90187f0a64e.jpg",
        lore:
            "Está cordilheira é famosa por abrigar centenas de elfos expurgados pelo rei Ivril do reino de Armuned",
      )
    ],
  );
}
