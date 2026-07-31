part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  final bool login;

  const LoginState(this.login);
}

final class LoginInitial extends LoginState {
  const LoginInitial(super.login);
}

class LoginSuccess extends LoginState {
  const LoginSuccess(super.login);
}

class RegisterSuccess extends LoginState{
  const RegisterSuccess(super.login);

}

class LoginLoading extends LoginState {
  const LoginLoading(super.login);
}


class LoginError extends LoginState {
  final AppExeception exception;

  const LoginError(this.exception, super.login);
}
