part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final AppExeception exception;

  LoginError(this.exception);
}

class LoginModeChanged extends LoginState{}
