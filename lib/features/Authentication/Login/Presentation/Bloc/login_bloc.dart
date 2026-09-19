
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/Core/error/exception.dart';
import 'package:login/Core/error/validator_response.dart';

import 'package:login/features/Authentication/Login/Domain/Repository/i_login_repository.dart';
import 'package:login/features/Authentication/Register/Presentation/Function/password_validator_register.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>
    with HttpResponseValidator, PasswordValidatorRegister {
  final ILoginRepository repository;

  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonClicked) {
        emit(LoginLoading());

        try {
          final result = await repository.login(event.username, event.password);
          emit(LoginSuccess());
        } catch (e) {
          emit(LoginError(AppExeception()));
        }

        try {} catch (e) {
          emit(LoginError(AppExeception()));
        }
      } else if (event is LoginModeChangedIsClicked) {
        emit(LoginModeChanged());
      }
    });
  }
}
