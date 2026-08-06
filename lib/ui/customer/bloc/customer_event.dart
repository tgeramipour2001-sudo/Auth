part of 'customer_bloc.dart';

@immutable
sealed class CustomerEvent {}

class CustomerStarted extends CustomerEvent {}
class CustomerClicked extends CustomerEvent{}
class CustomeRefresh extends CustomerEvent{}