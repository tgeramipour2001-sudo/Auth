part of 'save_order_bloc.dart';

@immutable
sealed class SaveOrderState {}

final class SaveOrderInitial extends SaveOrderState {}



class ComeentChangedSuccess extends SaveOrderState{}

class SeveOrderSuccess extends SaveOrderState{
  final int orderId;

  SeveOrderSuccess({required this.orderId});
}

class CancelOrderSuccess extends SaveOrderState{}

class SaveOrderError extends SaveOrderState{
  final AppExeception exeception;

  SaveOrderError(this.exeception);

}

class SaveOrderLoading extends SaveOrderState{}