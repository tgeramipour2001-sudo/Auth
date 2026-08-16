import 'package:bloc/bloc.dart';
import 'package:login/common/exception.dart';
import 'package:login/features/register/functions/password_validator_register.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/features/register/data/repository/i_register_repository.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>
    with HttpResponseValidator, PasswordValidatorRegister {
  final IRegisterRepository repository;
  RegisterBloc({required this.repository}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterButtonClicked) {
        final validatedResult = validatePasswordRegister(event.password);

        if (validatedResult) {
          final result = await repository.register(event.Emial, event.password);
          emit(RegisterSuccess());
        } else {
          emit(
            RegisterError(
              AppExeception(
                message:
                    'The password must be at least 8 characters long (using non-Persian characters) and contain both uppercase and lowercase letters',
              ),
            ),
          );
        }
      }else if(event is RegisterModeChangedIsClicked){
        emit(RegisterModeChanged());
      }
    });
  }
}
