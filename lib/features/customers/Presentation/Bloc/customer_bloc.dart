import 'package:bloc/bloc.dart';
import 'package:login/Core/error/exception.dart';
import 'package:login/Features/Customers/Domain/Entity/customer_entity.dart';

import 'package:login/Features/Customers/Data/repository/customer_repository.dart';
import 'package:meta/meta.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  CustomerBloc({required this.customerRepository}) : super(CustomerLoading()) {
    on<CustomerEvent>((event, emit) async {
      if (event is CustomerStarted) {
        emit(CustomerLoading());
        await Future.delayed(Duration(seconds: 1));
        try {
          final customers = await customerRepository.getAll();
          emit(CustomerSuccess(customers: customers));
        } catch (e) {
          emit(
            CustomerError(
              exception: AppExeception(message: 'Something went wrong'),
            ),
          );
        }
      } else if (event is CustomerClicked) {
      } else if (event is CustomerFilter) {
        emit(CustomerLoading());

        try {
          final customers = await customerRepository.searchCustomer(
            event.SearchedField,
          );
          emit(CustomerSuccess(customers: customers));
        } catch (e) {
          emit(CustomerError(exception: AppExeception(message: e.toString())));
        }
      }
    });
  }
}
