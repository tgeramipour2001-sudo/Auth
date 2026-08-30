import 'package:dio/dio.dart';

final List<Map<String, dynamic>> customers = 
[
  {
    "id": 1,
    "name": "Coca Cola",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 25,
    "warehouse":"Center"
  },
  {
    "id": 2,
    "name": "Mineral Water",
    "unit": "Bottle",
    "unitId": 101,
    "stock": 50,
     "warehouse":"Center"
  },
  {
    "id": 3,
    "name": "Chips",
    "unit": "Pack",
    "unitId": 102,
    "stock": 18,
     "warehouse":"Center"
  },
  {
    "id": 4,
    "name": "Sugar",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 12,
     "warehouse":"Center"
  },
  {
    "id": 5,
    "name": "Rice",
    "unit": "Kilogram",
    "unitId": 103,
    "stock": 30,
     "warehouse":"Center"
  }
];

Response ProductFakeResponse() {
  return Response(
    requestOptions: RequestOptions(path: '/customers'),
    statusCode: 200,
    data: customers,
  );
}
