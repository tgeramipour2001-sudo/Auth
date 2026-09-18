
import 'package:login/Core/Http_Client/http_client.dart';
import 'package:login/Features/Customers/Data/Data_Source/Remote/customer_data_source.dart';
import 'package:login/Features/Customers/Domain/Entity/customer_entity.dart';
import 'package:login/Features/Customers/Domain/Repository/i_customer_repository.dart';

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
