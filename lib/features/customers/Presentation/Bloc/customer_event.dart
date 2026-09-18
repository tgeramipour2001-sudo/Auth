part of 'customer_bloc.dart';

@immutable
sealed class CustomerEvent {}

class CustomerStarted extends CustomerEvent {}

class CustomerClicked extends CustomerEvent{}

class CustomerFilter extends CustomerEvent{
  final String SearchedField;

  CustomerFilter({required this.SearchedField});
  
}