


import 'package:login/features/customers/domain/entity/customer_entity.dart';

List<CustomerEntity> filterCustomers(
  String searchedField,
  List<CustomerEntity> customers,
) {
  final List<CustomerEntity> customerFilter = [];

  for (final customer in customers) {
    if (customer.name.toLowerCase().contains(searchedField.toLowerCase())) {
      customerFilter.add(customer);
    }
  }
  return customerFilter;
}
