import 'package:dio/dio.dart';
import 'package:login/Core/Error/exception.dart';


mixin HttpResponseValidator {
void validatedResponse(Response response) {
    if (response.statusCode != 200) {
      AppExeception(message: 'error ');
    }
  }
}