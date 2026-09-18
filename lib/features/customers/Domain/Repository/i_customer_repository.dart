import 'package:login/Features/Customers/Domain/Entity/customer_entity.dart';

abstract class ICustomerRepository {
  Future<List<CustomerEntity>> getAll();
  Future<List<CustomerEntity>> searchCustomer(String name);
}
