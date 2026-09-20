part of 'customer_bloc.dart';

@immutable
sealed class CustomerState {}



class CustomerLoading extends CustomerState {}
class CustomerSuccess extends CustomerState{
  final List<CustomerEntity> customers;

  CustomerSuccess({required this.customers});
  
}

class CustomerError extends CustomerState {
  final AppExeception exception;

  CustomerError({ required this.exception});
}


class CustomerChanged extends CustomerState{}