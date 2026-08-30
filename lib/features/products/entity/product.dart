class ProductEntity {
  final int id;
  final String name;
  final String unit;
  final int unitId;
  final int stock;
  final String warehouse;

  ProductEntity.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json['name'],
      unit = json['unit'],
      unitId = json['unitId'],
      stock = json['stock'],
      warehouse = json['warehouse'];
}
