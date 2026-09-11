part of 'save_order_bloc.dart';

@immutable
sealed class SaveOrderEvent {}


class CommentChanged extends SaveOrderEvent {
  final String comment;
  final int customerId;

  CommentChanged({required this.comment, required this.customerId});
}

class SendOrder extends SaveOrderEvent {
  final int customerId;

  SendOrder({required this.customerId});
}

class CancelOrder extends SaveOrderEvent {
  final int customerId;

  CancelOrder({required this.customerId});
}

class SaveOrderStarted extends SaveOrderState{}


