import 'package:login/data/customer.dart';

abstract class ICustomerDataSource{
    Future<List<CustomerEntity>> getAll();
    Future<List<CustomerEntity>> searchCustomer(String name);
}