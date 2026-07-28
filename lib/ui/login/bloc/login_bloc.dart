import 'package:bloc/bloc.dart';
import 'package:login/common/exceprion.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/data/repository/login_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with HttpResponseValidator{
  final ILoginRepository repository;
  bool login;
  LoginBloc({required this.repository, this.login = true})
    : super(LoginInitial(login)) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonClicked) {
        emit(LoginLoading(login));

        if (login) {
          try{
          final result = await repository.login(event.username, event.password);
          emit(LoginSuccess(login));
          }catch(e){
            emit(LoginError(AppExeception(), login));
          }
        } else {
          final validatedResult = validatePasswordRegister(event.password);

          if(validatedResult){
          final result = await repository.register(
            event.username,
            event.password,
          );
          emit(LoginSuccess(login));
          }else{emit(LoginError(AppExeception(message:  'The password must be at least 8 characters long (using non-Persian characters) and contain both uppercase and lowercase letters.'), login));}
        }

        try {} catch (e) {
          emit(LoginError(AppExeception(), login));
        }
      } else if (event is LoginModeChangedIsClicked) {
        login = !login;
        emit(LoginInitial(login));
      }
    });
  }

  bool validatePasswordRegister(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    return regex.hasMatch(password);
  }
}
