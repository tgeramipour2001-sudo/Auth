import 'package:dio/dio.dart';
import 'package:login/common/fake_response_customer.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/data/customer.dart';
import 'package:login/data/source/i_customer_data_source.dart';
import 'package:login/ui/customers/functions/filterCustomers.dart';

class CustomerRemoteDataSource
    with HttpResponseValidator
    implements ICustomerDataSource {
  final Dio httpClient;

  CustomerRemoteDataSource({required this.httpClient});

  @override
  Future<List<CustomerEntity>> getAll() async {
    //final response = await httpClient.get('');
    final response = CustomerFakeResponse();
    validatedResponse(response);

    final List<CustomerEntity> customers = [];
    for (var value in (response.data as List)) {
      customers.add(CustomerEntity.fromJson(value));
    }

    return customers;
  }

  @override
  Future<List<CustomerEntity>> searchCustomer(String name) async {
    //final response = await httpClient.get('');

    return FilterCustomers(name, await getAll());
  }
}
