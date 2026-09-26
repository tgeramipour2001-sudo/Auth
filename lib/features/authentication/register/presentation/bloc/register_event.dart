part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterButtonClicked extends RegisterEvent {
  final RegisterEntity registerEntity;

  RegisterButtonClicked({required this.registerEntity});
}

class RegisterModeChangedIsClicked extends RegisterEvent {}

class RegisterStarted extends RegisterEvent {}
