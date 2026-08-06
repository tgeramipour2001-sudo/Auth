import 'package:bloc/bloc.dart';
import 'package:login/common/exceprion.dart';
import 'package:login/data/customer.dart';
import 'package:login/data/repository/i_customer_repository.dart';
import 'package:meta/meta.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final ICustomerRepository customerRepository;
  CustomerBloc({required this.customerRepository}) : super(CustomerLoading()) {
    on<CustomerEvent>((event, emit) async {
      if (event is CustomerStarted || event is CustomeRefresh) {
        emit(CustomerLoading());
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
      } else if (event is CustomerClicked) {}
    });
  }
}
