import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/Startup/injection.dart';
import 'package:login/core/authentication/widget/paasword_tetx_field.dart';
import 'package:login/core/authentication/widget/remember_me_check_box.dart';
import 'package:login/core/authentication/widget/usename_text-field.dart';
import 'package:login/core/startup/app_bootstrap.dart';
import 'package:login/features/authentication/Register/Presentation/bloc/register_bloc.dart';
import 'package:login/features/authentication/login/presentation/login.dart';
import 'package:login/features/authentication/register/domain/entity/register_entity.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool saveInfo = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocProvider<RegisterBloc>(
        create: (context) => getIt<RegisterBloc>(),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AppBootStrap()));
            } else if (state is RegisterModeChanged) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          },

          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff88A9DC), Color(0xff204680)],
                ),
              ),

              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70, 100, 70, 0),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Register', style: theme.textTheme.headlineLarge),

                        SizedBox(height: 30),

                        //username
                        Text('Email', style: theme.textTheme.titleMedium),

                        SizedBox(height: 10),
                        UsernameTextField(usernameController),

                        SizedBox(height: 20),
                        //password
                        Text('Password', style: theme.textTheme.titleMedium),
                        SizedBox(height: 10),
                        PasswordTextField(passwordController),

                        SizedBox(height: 20),

                        BlocBuilder<RegisterBloc, RegisterState>(
                          buildWhen: (previous, current) =>
                              current is RegisterError ||
                              current is RegisterLoading,
                          builder: (context, state) {
                            return Column(
                              children: [
                                if (state is RegisterError)
                                  Text(state.exeception.message.toString()),

                                //remember me check box
                                RememberMe(
                                  saveInfoChanged: (value) {
                                    setState(() {
                                      saveInfo = value;
                                    });
                                  },
                                ),
                                //forget password button
                                SizedBox(height: 20),
                                //sign in button
                                ElevatedButton(
                                  onPressed: () {
                                    getIt<RegisterBloc>().add(
                                      RegisterButtonClicked(
                                        registerEntity: RegisterEntity(
                                          username: usernameController.text,
                                          password: passwordController.text,
                                          saveInfo: saveInfo,
                                        ),
                                      ),
                                    );
                                  },
                                  child: state is RegisterLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Text(
                                          'Sign up',
                                          style: theme.textTheme.headlineMedium,
                                        ),
                                ),
                              ],
                            );
                          },
                        ),

                        //SizedBox(height: 150),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have an account?',
                              style: theme.textTheme.titleSmall,
                            ),
                            SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                getIt<RegisterBloc>().add(
                                  RegisterModeChangedIsClicked(),
                                );
                              },
                              child: Text(
                                'Login',
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),

                        //register
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
