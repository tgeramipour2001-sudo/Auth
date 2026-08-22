
import 'package:dio/dio.dart';

final List<Map<String, dynamic>> customers = [
  {
    "id": 1,
    "name": "John Smith",
    "address": "12 Oxford Street, London",
    "accountBalance": 2450.75,
    "creditBalance": 1200.00,
    "lastOrderDate": "2026-07-30",
    "image_file_name":"",
    "latitude":"51.5152",
    "longtitude":  "-0.1414"
  },
  {
    "id": 2,
    "name": "Emma Johnson",
    "address": "45 Maple Avenue, Toronto",
    "accountBalance": 980.50,
    "creditBalance": 500.00,
    "lastOrderDate": "2026-07-28",
    "image_file_name":"",
    "latitude":"43.6532",
    "longtitude": "-79.3832"
  },
  {
    "id": 3,
    "name": "Michael Brown",
    "address": "78 Sunset Blvd, Los Angeles",
    "accountBalance": 5120.00,
    "creditBalance": 2000.00,
    "lastOrderDate": "2026-07-25",
    "image_file_name":"",
    "latitude":"34.0980",
    "longtitude":  " -118.3267"
  },
  {
    "id": 4,
    "name": "Olivia Davis",
    "address": "19 King Street, Sydney",
    "accountBalance": 350.80,
    "creditBalance": 150.00,
    "lastOrderDate": "2026-07-20",
    "image_file_name":"",
    "latitude":"-33.8647",
    "longtitude":  "151.2069"
  },
  {
    "id": 5,
    "name": "William Miller",
    "address": "88 Green Road, Dublin",
    "accountBalance": 7600.00,
    "creditBalance": 3500.00,
    "lastOrderDate": "2026-07-18",
    "image_file_name":"",
    "latitude":"51.5152",
    "longtitude":  "-0.1414"
  },
  {
    "id": 6,
    "name": "Sophia Wilson",
    "address": "10 River Park, New York",
    "accountBalance": 1280.30,
    "creditBalance": 700.00,
    "lastOrderDate": "2026-07-15",
    "image_file_name":"",
     "latitude":"51.5152",
    "longtitude":  "-0.1414"
  },
  {
    "id": 7,
    "name": "James Moore",
    "address": "31 Lake View, Chicago",
    "accountBalance": 450.00,
    "creditBalance": 300.00,
    "lastOrderDate": "2026-07-12",
    "image_file_name":"",
    "latitude":"51.5152",
    "longtitude":  "-0.1414"
  },
  {
    "id": 8,
    "name": "Isabella Taylor",
    "address": "5 Palm Street, Miami",
    "accountBalance": 2950.90,
    "creditBalance": 1800.00,
    "lastOrderDate": "2026-07-10",
    "image_file_name":"",
    "latitude":"51.5152",
    "longtitude":  "-0.1414"
  },
  {
    "id": 9,
    "name": "Benjamin Anderson",
    "address": "90 Hill Road, Berlin",
    "accountBalance": 620.40,
    "creditBalance": 450.00,
    "lastOrderDate": "2026-07-08",
    "image_file_name":"",
    "latitude":"51.5152",
    "longtitude":  "-0.1414"
  },
  {
    "id": 10,
    "name": "Charlotte Thomas",
    "address": "14 Central Avenue, Paris",
    "accountBalance": 8420.10,
    "creditBalance": 4000.00,
    "lastOrderDate": "2026-07-05",
    "image_file_name":"",
    "latitude":"51.5152",
    "longtitude":  "-0.1414"
  },
];

Response CustomerFakeResponse() {
  return Response(
    requestOptions: RequestOptions(path: '/customers'),
    statusCode: 200,
    data: customers,
  );
}
