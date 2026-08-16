import 'package:login/domain/http_client.dart';
import 'package:login/features/customers/entity/customer.dart';
import 'package:login/features/customers/data/repository/i_customer_repository.dart';
import 'package:login/features/customers/data/data_source/customer_data_source.dart';
import 'package:login/features/customers/data/data_source/i_customer_data_source.dart';

final CustomerRepository customerRepository = CustomerRepository(
  dataSource: CustomerRemoteDataSource(httpClient: httpClient),
);

class CustomerRepository implements ICustomerRepository {
  final ICustomerDataSource dataSource;

  CustomerRepository({required this.dataSource});

  @override
  Future<List<CustomerEntity>> getAll() {
    return dataSource.getAll();
  }

  @override
  Future<List<CustomerEntity>> searchCustomer(String name) {
    return dataSource.searchCustomer(name);
  }
}
