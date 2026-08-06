import 'package:login/data/customer.dart';

abstract class ICustomerDataSource{
    Future<List<CustomerEntity>> getAll();
    Future<CustomerEntity> searchCustomer(String name);
}