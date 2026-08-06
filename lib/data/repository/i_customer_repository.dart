import 'package:login/data/customer.dart';

abstract class ICustomerRepository{
    Future<List<CustomerEntity>> getAll();
    Future<CustomerEntity> searchCustomer(String name);
}