import 'package:bloc/bloc.dart';
import 'package:login/common/exceprion.dart';
import 'package:login/common/password_validator_register.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/data/repository/i_login_repository.dart';
import 'package:meta/meta.dart';

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
