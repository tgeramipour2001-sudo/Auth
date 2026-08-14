import 'package:login/data/customer.dart';

abstract class ICustomerRepository{
    Future<List<CustomerEntity>> getAll();
    Future<List<CustomerEntity>> searchCustomer(String name);
   
}