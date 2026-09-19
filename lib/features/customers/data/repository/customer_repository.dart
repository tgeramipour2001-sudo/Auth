

import 'package:login/core/http_client/http_client.dart';
import 'package:login/features/customers/data/data_source/remote/customer_data_source.dart';
import 'package:login/features/customers/domain/entity/customer_entity.dart';
import 'package:login/features/customers/domain/repository/i_customer_repository.dart';

final CustomerRepository customerRepository = CustomerRepository(
  dataSource: CustomerRemoteDataSource(httpClient: httpClient),
);

class CustomerRepository implements ICustomerRepository {
  final CustomerRemoteDataSource dataSource;

  CustomerRepository({required this.dataSource});

  @override
  Future<List<CustomerEntity>> getAll() => dataSource.getAll();

  @override
  Future<List<CustomerEntity>> searchCustomer(String name) =>
      dataSource.searchCustomer(name);
}
