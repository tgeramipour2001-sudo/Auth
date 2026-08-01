part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final AppExeception exeception;

  RegisterError(this.exeception);
}

class RegisterLoading extends RegisterState {}

class RegisterModeChanged extends RegisterState{}