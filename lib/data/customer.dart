

class CustomerEntity {
  final int id;
  final String name;
  final String address;
  final num accountBalance;
  final num creditBalance;
  final String lastOrderDate;

  CustomerEntity.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"],
      address = json["address"],
      accountBalance = json["accountBalance"],
      creditBalance = json["creditBalance"],
      lastOrderDate = json["lastOrderDate"].toString().split('T').first;
}
