import 'package:bloc/bloc.dart';
import 'package:login/core/error/exception.dart';


import 'package:login/core/startup/injection.dart';
import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';
import 'package:login/features/order/domain/repository/i_order_cart_repository.dart';
import 'package:login/features/order/presentation/bloc/product/products_list_bloc.dart';
import 'package:meta/meta.dart';

part 'save_order_event.dart';
part 'save_order_state.dart';

class SaveOrderBloc extends Bloc<SaveOrderEvent, SaveOrderState> {
  final IOrderCartRepository saveOrderRepository;

  SaveOrderBloc({required this.saveOrderRepository})
    : super(SaveOrderInitial()) {
    on<SaveOrderEvent>((event, emit) async {
      if (event is CommentChanged) {
        emit(ComeentChangedSuccess());
      } else if (event is SendOrder) {
        try {
          final Map<int, CartEntity> order = {
            event.customerId: event.customerOrder,
          };
          final orderId = await saveOrderRepository.saveOrder(order);
          emit(SeveOrderSuccess(orderId: orderId));
          getIt<ProductsListBloc>().add(
            ProductListDelete(customerId: event.customerId),
          );
        } catch (e) {
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
