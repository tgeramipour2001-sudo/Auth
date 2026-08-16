import 'package:login/features/customers/entity/customer.dart';

abstract class ICustomerDataSource{
    Future<List<CustomerEntity>> getAll();
    Future<List<CustomerEntity>> searchCustomer(String name);
}