import 'package:bloc/bloc.dart';
import 'package:login/Core/Error/exception.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';
import 'package:login/Features/Order/Domain/Repository/i_order_cart_repository.dart';
import 'package:login/Features/Order/Presentation/Bloc/Product/products_list_bloc.dart';

import 'package:login/core/Startup/injection.dart';
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
