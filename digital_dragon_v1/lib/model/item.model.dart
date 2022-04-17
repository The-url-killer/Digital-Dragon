class Item {
  String id;
  String name;
  String price;
  double size;
  String typeEquipment;
  String? description;
  String? damage;
  String? weaponClass;
  bool? desStealth;
  String? armorClass;
  int? strength;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.typeEquipment,
    this.armorClass,
    this.damage,
    this.desStealth,
    this.description,
    this.strength,
    this.weaponClass,
  });
}
