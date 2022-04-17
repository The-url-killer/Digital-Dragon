import 'package:digital_dragon_v1/model/campaign-character-representation.model.dart';
import 'package:digital_dragon_v1/model/character-model-screen-representation.model.dart';
import 'package:digital_dragon_v1/model/item.model.dart';
import 'package:digital_dragon_v1/model/spell.model.dart';

CharacterModelScreen getCharacterInfo(id) {
  return CharacterModelScreen(
      id: "ajnvjdnajvadj9bvjaodbvjadb",
      aClass: "Bárbaro",
      age: 180,
      atributes: {
        "carism": 13,
        "dextery": 12,
        "constituation": 14,
        "inteligence": 8,
        "strength": 15,
        "winsdom": 10
      },
      expertises: {
        "acrobatics": false,
        "animals": false,
        "arcanism": false,
        "atletism": true,
        "atuation": false,
        "history": false,
        "intuitc": false,
        "investigation": false,
        "intimidation": true,
        "speach": false,
        "medicine": false,
        "nature": false,
        "perception": false,
        "persuasion": false,
        "religion": true,
        "sleight of hand": false,
        "stealth": false,
        "survival": false,
      },
      level: 1,
      money: {"po": 0, "pl": 1, "pp": 10, "pc": 100, "pe": 0},
      hair: "longos mas sem nada em cima",
      heigth: 1.35,
      tendency: "Leal Bom",
      name: "Cleber",
      peel: "Branca",
      race: "Anão",
      ca: 16,
      lifePoints: 8,
      speed: 7,
      image:
          "https://i.pinimg.com/564x/4f/93/45/4f93459b2f6afcaab20dade397f67d69.jpg",
      campaign:
          "NDJNVKOADNVKODANKOVNADKONVADNVKOADNKVOADNOJVNADJOVNANVOJDANBVJODANOJVNADIJ",
      connections: "Anões da montanha de valerium",
      defects: "Fácil perder a cabeça",
      lore: "Um velho anao que vivia em uma grande montanha dourada",
      ideas: "Sempre lutar pela justiça",
      personalityTrails: "Não diferenciar mentiras de verdades",
      speels: [
        Skill(
            name: "Respingo Ácido",
            castTime: "1 ação",
            classes: [
              "Feiticeiro",
              "Bruxo",
              "Artifice",
            ],
            component: "V, S",
            description:
                "Você lança uma bolha de ácido. Escolha uma ou duas criaturas que você possa ver dentro do alcance. Se você escolher dois, eles devem estar a menos de 1,5 metros um do outro. Um alvo deve ser bem sucedido em um teste de resistência de Destreza ou sofrerá 1d6 de dano de ácido. O dano desta magia aumenta em 1d6 quando você atinge o 5º nível (2d6), 11º nível (3d6) e 17º nível (4d6).",
            duration: "Intântaneo",
            level: 0,
            range: "60 pés",
            school: "Conjuração"),
        Skill(
            name: "Respingo de Fogo",
            castTime: "1 ação",
            classes: [
              "Feiticeiro",
              "Bruxo",
              "Artifice",
            ],
            component: "V, S",
            description:
                "Você lança uma bolha de ácido. Escolha uma ou duas criaturas que você possa ver dentro do alcance. Se você escolher dois, eles devem estar a menos de 1,5 metros um do outro. Um alvo deve ser bem sucedido em um teste de resistência de Destreza ou sofrerá 1d6 de dano de ácido. O dano desta magia aumenta em 1d6 quando você atinge o 5º nível (2d6), 11º nível (3d6) e 17º nível (4d6).",
            duration: "Intântaneo",
            level: 0,
            range: "60 pés",
            school: "Conjuração"),
        Skill(
            name: "Respingo Aquático",
            castTime: "1 ação",
            classes: [
              "Feiticeiro",
              "Bruxo",
              "Artifice",
            ],
            component: "V, S",
            description:
                "Você lança uma bolha de ácido. Escolha uma ou duas criaturas que você possa ver dentro do alcance. Se você escolher dois, eles devem estar a menos de 1,5 metros um do outro. Um alvo deve ser bem sucedido em um teste de resistência de Destreza ou sofrerá 1d6 de dano de ácido. O dano desta magia aumenta em 1d6 quando você atinge o 5º nível (2d6), 11º nível (3d6) e 17º nível (4d6).",
            duration: "Intântaneo",
            level: 0,
            range: "60 pés",
            school: "Conjuração"),
      ],
      itens: [
        Item(
          damage: "1d4 perfurante",
          description: "Acuidade, leve, arremesso (distância 6/18)",
          id: "47984a14-a0f2-4081-b09e-7db97f660bd2",
          name: "Adaga",
          price: "2 po",
          size: 0.5,
          typeEquipment: "WEAPON",
          weaponClass: "Armas Simples Corpo-a-Corpo",
        ),
        Item(
          id: "54f51df2-237a-4755-9220-e78d43c1e49c",
          name: "Ábaco",
          price: "2 po",
          size: 1,
          typeEquipment: "COMMON",
        ),
        Item(
          armorClass: "11 + modificador de Des",
          desStealth: true,
          id: "e74f5a58-ac81-4916-a55f-22971ae9eb00",
          name: "Acolchoada",
          price: "5 po",
          size: 4,
          strength: 0,
          typeEquipment: "ARMOR",
        )
      ],
      alies: [
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
      notes: [
        "Lembrar de adicionar o Guilherme na campanha",
        "Arrumar fichas no final da próxima sessão",
        "Remover monstros não usados mais"
      ],
      pets: [
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
      ]);
}
