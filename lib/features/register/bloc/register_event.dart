part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterButtonClicked extends RegisterEvent {
  final String Emial;
  final String password;

  RegisterButtonClicked({required this.Emial, required this.password});
}

class RegisterModeChangedIsClicked extends RegisterEvent{

}

class RegisterStarted extends RegisterEvent{}