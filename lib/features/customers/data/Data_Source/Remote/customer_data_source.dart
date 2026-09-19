import 'package:dio/dio.dart';
import 'package:login/core/customer/logic/filter_customers.dart';
import 'package:login/core/error/validator_response.dart';
import 'package:login/features/customers/data/data_source/mock/fake_response_customer.dart';
import 'package:login/features/customers/domain/entity/customer_entity.dart';

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
