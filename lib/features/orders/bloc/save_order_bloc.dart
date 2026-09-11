import 'package:bloc/bloc.dart';
import 'package:login/common/exception.dart';
import 'package:login/features/orders/data/repository/i_save_order_repository.dart';
import 'package:login/features/products/entity/customer_order.dart';
import 'package:meta/meta.dart';

part 'save_order_event.dart';
part 'save_order_state.dart';

class SaveOrderBloc extends Bloc<SaveOrderEvent, SaveOrderState> {
 
  final ISaveOrderRepository saveOrderRepository;
  late Map<int, CustomerOrder> order;
  SaveOrderBloc({ required this.saveOrderRepository})
    : super(SaveOrderInitial()) {
    on<SaveOrderEvent>((event, emit) async {

      
      if (event is CommentChanged) {
        emit(ComeentChangedSuccess());
      } else if (event is SendOrder) {
        final customerIndex = order[event.customerId];

        if (customerIndex != null) {
          final Map<int, CustomerOrder> order = {
            event.customerId: customerIndex!,
          };
          final orderId = await saveOrderRepository.saveOrder(order);
          emit(SeveOrderSuccess(orderId: orderId));
        } else {
          emit(
            SaveOrderError(
              AppExeception(message: 'Could not save order. Try again'),
            ),
          );
        }
      }
    });
  }
}
