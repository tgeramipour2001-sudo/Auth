part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class LoginButtonClicked extends LoginEvent{
  final String username;
  final String password;

  LoginButtonClicked({required this.username, required this.password});


}

class RegisterButtonClicked extends LoginEvent{
  final String Emial;
  final String password;

  RegisterButtonClicked({required this.Emial, required this.password});
}

class LoginModeChangedIsClicked extends LoginEvent{

}

class LoginStarted extends LoginEvent{}
