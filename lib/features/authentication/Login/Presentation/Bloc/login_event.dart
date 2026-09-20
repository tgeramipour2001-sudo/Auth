part of 'login_bloc.dart';


sealed class LoginEvent {}


class LoginButtonClicked extends LoginEvent{
  final String username;
  final String password;

  LoginButtonClicked({required this.username, required this.password});


}

class LoginModeChangedIsClicked extends LoginEvent{

}

class LoginStarted extends LoginEvent{}
