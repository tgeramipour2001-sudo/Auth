import 'package:dio/dio.dart';

final fakeResponseLogin = Response(
  requestOptions: RequestOptions(path: '/login'),
  statusCode: 200,
  data: {
    "token_type": "Bearer",
    "expires_in": 1296000,
    "access_token": "fake_access_token",
    "refresh_token": "fake_refresh_token",
  },
);

final fakeResponseLoginFalse = Response(
  requestOptions: RequestOptions(path: '/login'),
  statusCode: 404,
  data: {
    "token_type": "Bearer",
    "expires_in": 1296000,
    "access_token": "fake_access_token",
    "refresh_token": "fake_refresh_token",
  },
);

final fakeResponseRegister = Response(
  requestOptions: RequestOptions(path: '/register'),
  statusCode: 200,
  data: {
    "token":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGU1NWE2NmUwZjRjODczNjFmYjZkOWM3MzQ4Y2JkYjc1NzdlZmI3YzhmOTg0OGNlNWUxOTNjMzg0MjZkODNkYWQ3N2FiNDliODI0OTI5NGYiLCJpYXQiOjE3ODUyNTQ3NDUuMjYzOTgsIm5iZiI6MTc4NTI1NDc0NS4yNjM5ODUsImV4cCI6MTgxNjc5MDc0NS4yMzc3NDEsInN1YiI6IjI3NiIsInNjb3BlcyI6W119.BxjElQ8hdlv3V8pUQqUldUSPp7BxcFlySqMORC3eEOWJfIOFY6oCmD0fscAjP0idWO_D76c0HtKaZ94-MjiJ-vMWefEYQResYKpTFk7xjradmdUvpNnw-QQfx1tuTbGtQHmuY92cBF2zDMXNlejDv45QQgegUneep8D4sIr22LsNvWh7a_Reyn66FE5e32VIj9ObwxGDTcL-bAIc3GJxvqnmPdOSY8J2k5TzGJjM6X0TwHpoIMuKysJwIzWQ5TCGmTbijvU53U8okuSVY5knTy0RmozhVUUII2LVeVNS1MSi6smkggi8_-sL5B_nwj4JPIVKjERLgxWjQHirs1gMxXXOHFYSwG5XRVdKaE6e9pyUWTVlxGV5RTig8bXVDgDONArbc_vSy2M_gS2y4AbNlRaxd_4_YN9hmGaRn5zYjt6nfAt8p7B760gOGUSytY0yXRRQY_GXMxGH3F_sXnx3UW906AWXzOKwEJtLiK24lIfS298_-7Um2kjf0tFRs_IGC704XGLcnSEgCZ7S2Oqlz6hXk99WyPc2kSfdnLu-hypxRcfnaZzVn5W8wsoaoA0IRJfe9o0ir99kmC8V_KEIJQJXElDGOHv8sr60Pvmf_D0LcQkUvWbTHjv_taYBR_zqGoArRVVLYBQgkNTGt4kuIxuvELJtlL47t8Ra_l-R-E0",
  },
);
