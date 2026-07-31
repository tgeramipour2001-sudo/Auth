import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/repository/i_login_repository.dart';
import 'package:login/ui/home.dart';
import 'package:login/ui/login/bloc/login_bloc.dart';
import 'package:login/ui/login/paasword_tetx_field.dart';
import 'package:login/ui/login/usename_text-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      //backgroundColor: theme.colorScheme.surface.withOpacity(0.9999),
      body: BlocProvider<LoginBloc>(
        create: (context) {
          final bloc = LoginBloc(repository: loginRepository, login: true);
          bloc.add(LoginStarted());
          return bloc;
        },

        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
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
                        BlocBuilder<LoginBloc, LoginState>(
                          buildWhen: (previous, current) =>
                              current is LoginInitial,
                          builder: (context, state) {
                            return Text(
                              state.login ? 'Login' : 'Register',
                              style: theme.textTheme.headlineLarge,
                            );
                          },
                        ),
                        SizedBox(height: 30),

                        //username
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Text(
                              state.login ? 'Username' : 'Email',
                              style: theme.textTheme.titleMedium,
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        UsernameTextField(_usernameController),

                        SizedBox(height: 20),
                        //password
                        Text('Password', style: theme.textTheme.titleMedium),
                        SizedBox(height: 10),
                        PasswordTextField(_passwordController),

                        SizedBox(height: 20),

                        BlocBuilder<LoginBloc, LoginState>(
                          buildWhen: (previous, current) =>
                              current is LoginError ||
                              current is LoginLoading ||
                              current is LoginInitial,
                          builder: (context, state) {
                            return Column(
                              children: [
                                if (state is LoginError)
                                  Text(state.exception.message.toString()),
                                //forget password button
                                if (state.login && state is LoginError)
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forget Password?',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                SizedBox(height: 20),
                                //sign in button
                                ElevatedButton(
                                  onPressed: () {
                                    state.login
                                        ? context.read<LoginBloc>().add(
                                            LoginButtonClicked(
                                              username:
                                                  _usernameController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          )
                                        : context.read<LoginBloc>().add(
                                            RegisterButtonClicked(
                                              Emial: _usernameController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );
                                  },
                                  child: state is LoginLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Text(
                                          state is LoginInitial
                                              ? 'Sign in'
                                              : 'Sign up',
                                          style: theme.textTheme.headlineMedium,
                                        ),
                                ),
                              ],
                            );
                          },
                        ),

                        //SizedBox(height: 150),
                        const Spacer(),
                        //register
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.login
                                      ? 'Dont have an account yet?'
                                      : 'Have an account?',
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(width: 12),
                                Positioned(
                                  bottom: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<LoginBloc>(
                                        context,
                                      ).add(LoginModeChangedIsClicked());
                                    },
                                    child: BlocBuilder<LoginBloc, LoginState>(
                                      buildWhen: (previous, current) =>
                                          current is LoginInitial,
                                      builder: (context, state) {
                                        return Text(
                                          state.login ? 'Register' : 'Login',
                                          style: theme.textTheme.titleSmall,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
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
