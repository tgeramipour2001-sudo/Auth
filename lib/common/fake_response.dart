import 'dart:math';

import 'package:dio/dio.dart';

class FakeResponseType {
  static const   int login = 1;
  static  const int register = 2;
  static  const int customer = 3;
}

Response fakeResponse(int value) {
  Response response = Response(requestOptions: RequestOptions(path: ''));
  switch (value) {
    case FakeResponseType.login:
      return Response(
        requestOptions: RequestOptions(path: '/login'),
        statusCode: statusCode(),

        data: {
          "token_type": "Bearer",
          "expires_in": 1296000,
          "access_token": token(),
          "refresh_token": token(),
        },
      );

    case FakeResponseType.register:
      return  Response(
        requestOptions: RequestOptions(path: '/register'),
        statusCode: statusCode(),

        data: {
          "token_type": "Bearer",
          "expires_in": 1296000,
          "access_token": token(),
        },
      );
    default:
  }

  return response;
}

int statusCode() {
  List<int> list = [200, 403];
  return list[Random().nextInt(list.length)];
}

String token() {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  final random = Random();

  return String.fromCharCodes(
    Iterable.generate(
      22,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}
