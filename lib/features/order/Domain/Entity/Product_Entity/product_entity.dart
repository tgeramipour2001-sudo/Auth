class ProductEntity {
  final int id;
  final String name;
  final String unit;
  final int unitId;
  final int stock;
  final String warehouse;
  final String fileName;
  final int price;
  final int discount;

  ProductEntity.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json['name'],
      unit = json['unit'],
      unitId = json['unitId'],
      stock = json['stock'],
      warehouse = json['warehouse'],
      fileName = json['file_name'],
      price = json["price"],
      discount = json["discount"];
}
