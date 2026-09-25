import 'package:dio/dio.dart';
import 'package:login/features/authentication/register/data/model/register_model.dart';

Response registerFakeResponse(RegisterModel register) {
  return Response(
    requestOptions: RequestOptions(path: '/customers'),
    statusCode: 200,
    data: {
      "id": 1009,
      "access_token": "mhbotf6obd97bfdin87hfbkd8",
      "expiration_date": "2026/10/13",
    },
  );
}
