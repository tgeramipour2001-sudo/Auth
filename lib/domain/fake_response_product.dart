import 'package:dio/dio.dart';

final List<Map<String, dynamic>> customers = [
  {
    "id": 1,
    "name": "Coca Cola",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 25,
    "warehouse": "Center"
  },
  {
    "id": 2,
    "name": "Mineral Water",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 50,
    "warehouse": "Center"
  },
  {
    "id": 3,
    "name": "Chips",
    "unit": "Pack",
    "unitId": 102,
    "stock": 18,
    "warehouse": "Center"
  },
  {
    "id": 4,
    "name": "Sugar",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 12,
    "warehouse": "Center"
  },
  {
    "id": 5,
    "name": "Rice",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 30,
    "warehouse": "Center"
  },
  {
    "id": 6,
    "name": "Pepsi",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 40,
    "warehouse": "North"
  },
  {
    "id": 7,
    "name": "Fanta",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 35,
    "warehouse": "North"
  },
  {
    "id": 8,
    "name": "Sprite",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 28,
    "warehouse": "South"
  },
  {
    "id": 9,
    "name": "Orange Juice",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 20,
    "warehouse": "Center"
  },
  {
    "id": 10,
    "name": "Apple Juice",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 22,
    "warehouse": "West"
  },
  {
    "id": 11,
    "name": "Biscuits",
    "unit": "Pack",
    "unitId": 102,
    "stock": 45,
    "warehouse": "Center"
  },
  {
    "id": 12,
    "name": "Chocolate",
    "unit": "Pack",
    "unitId": 102,
    "stock": 32,
    "warehouse": "North"
  },
  {
    "id": 13,
    "name": "Potato Chips",
    "unit": "Pack",
    "unitId": 102,
    "stock": 27,
    "warehouse": "South"
  },
  {
    "id": 14,
    "name": "Tomato Sauce",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 16,
    "warehouse": "Center"
  },
  {
    "id": 15,
    "name": "Cooking Oil",
    "unit": "Liter",
    "unitId": 104,
    "stock": 24,
    "warehouse": "West"
  },
  {
    "id": 16,
    "name": "Milk",
    "unit": "Liter",
    "unitId": 104,
    "stock": 38,
    "warehouse": "Center"
  },
  {
    "id": 17,
    "name": "Yogurt",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 19,
    "warehouse": "North"
  },
  {
    "id": 18,
    "name": "Flour",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 26,
    "warehouse": "South"
  },
  {
    "id": 19,
    "name": "Pasta",
    "unit": "Pack",
    "unitId": 102,
    "stock": 42,
    "warehouse": "Center"
  },
  {
    "id": 20,
    "name": "Tea",
    "unit": "Pack",
    "unitId": 102,
    "stock": 33,
    "warehouse": "West"
  },
  {
    "id": 21,
    "name": "Coffee",
    "unit": "Pack",
    "unitId": 102,
    "stock": 21,
    "warehouse": "Center"
  },
  {
    "id": 22,
    "name": "Salt",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 15,
    "warehouse": "North"
  },
  {
    "id": 23,
    "name": "Black Pepper",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 10,
    "warehouse": "South"
  },
  {
    "id": 24,
    "name": "Ketchup",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 29,
    "warehouse": "Center"
  },
  {
    "id": 25,
    "name": "Mayonnaise",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 17,
    "warehouse": "West"
  },
  {
    "id": 26,
    "name": "Corn Flakes",
    "unit": "Pack",
    "unitId": 102,
    "stock": 23,
    "warehouse": "Center"
  },
  {
    "id": 27,
    "name": "Honey",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 14,
    "warehouse": "North"
  },
  {
    "id": 28,
    "name": "Watermelon Juice",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 11,
    "warehouse": "South"
  },
  {
    "id": 29,
    "name": "Energy Drink",
    "unit": "Can",
    "unitId": 105,
    "stock": 36,
    "warehouse": "Center"
  },
  {
    "id": 30,
    "name": "Tuna Can",
    "unit": "Can",
    "unitId": 105,
    "stock": 18,
    "warehouse": "West"
  }
];

Response ProductFakeResponse() {
  return Response(
    requestOptions: RequestOptions(path: '/customers'),
    statusCode: 200,
    data: customers,
  );
}
