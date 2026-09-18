import 'package:dio/dio.dart';
import 'package:login/Core/Customer/Function/filter_customers.dart';
import 'package:login/Core/error/validator_response.dart';
import 'package:login/Features/Customers/Domain/Entity/customer_entity.dart';

import 'package:login/Features/Customers/Data/Data_Source/Mock/fake_response_customer.dart';

class CustomerRemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

  CustomerRemoteDataSource({required this.httpClient});

  Future<List<CustomerEntity>> getAll() async {
    final response = CustomerFakeResponse();
    validatedResponse(response);

    final List<CustomerEntity> customers = [];
    for (var value in (response.data as List)) {
      customers.add(CustomerEntity.fromJson(value));
    }

    return customers;
  }

  Future<List<CustomerEntity>> searchCustomer(String name) async {
    return filterCustomers(name, await getAll());
  }
}
