import 'package:login/features/customers/domain/entity/customer_entity.dart';

abstract class ICustomerRepository {
  Future<List<CustomerEntity>> getAll();
  Future<List<CustomerEntity>> searchCustomer(String name);
}