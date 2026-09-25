import 'package:bloc/bloc.dart';
import 'package:login/core/error/exception.dart';
import 'package:login/core/error/validator_response.dart';
import 'package:login/features/authentication/register/domain/entity/register_entity.dart';
import 'package:login/features/authentication/register/domain/repository/i_register_repository.dart';
import 'package:login/features/authentication/register/presentation/logic/password_validator_register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>
    with HttpResponseValidator, PasswordValidatorRegister {
  final IRegisterRepository repository;
  RegisterBloc({required this.repository}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterButtonClicked) {
        final validatedResult = validatePasswordRegister(
          event.registerEntity.password,
        );

        if (validatedResult) {
          final result = await repository.register(event.registerEntity);
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
      } else if (event is RegisterModeChangedIsClicked) {
        emit(RegisterModeChanged());
      }
    });
  }
}
