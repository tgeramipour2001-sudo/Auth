import 'package:login/data/customer.dart';

List<CustomerEntity> FilterCustomers(
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
