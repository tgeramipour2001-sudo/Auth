import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/repository/i_register_repository.dart';
import 'package:login/ui/home.dart';
import 'package:login/ui/login/bloc/login_bloc.dart';
import 'package:login/ui/login/login.dart';
import 'package:login/ui/register/bloc/register_bloc.dart';
import 'package:login/widget/paasword_tetx_field.dart';
import 'package:login/widget/usename_text-field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    void dispose() {
      _usernameController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    final theme = Theme.of(context);
    return Scaffold(
      //backgroundColor: theme.colorScheme.surface.withOpacity(0.9999),
      body: BlocProvider<RegisterBloc>(
        create: (context) {
          final bloc = RegisterBloc(repository: registerRepository);
          bloc.add(RegisterStarted());
          return bloc;
        },

        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
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
                        UsernameTextField(_usernameController),

                        SizedBox(height: 20),
                        //password
                        Text('Password', style: theme.textTheme.titleMedium),
                        SizedBox(height: 10),
                        PasswordTextField(_passwordController),

                        SizedBox(height: 20),

                        BlocBuilder<RegisterBloc, RegisterState>(
                          buildWhen: (previous, current) =>
                              current is RegisterError || current is RegisterLoading,
                          builder: (context, state) {
                            return Column(
                              children: [
                                if (state is RegisterError)
                                  Text(state.exeception.message.toString()),
                                //forget password button
                                if (state is RegisterError)
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
                                    context.read<RegisterBloc>().add(
                                      RegisterButtonClicked(
                                        Emial: _usernameController.text,
                                        password: _passwordController.text,
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
                        Text(
                          'Have an account?',
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(width: 12),
                        Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<RegisterBloc>(
                                context,
                              ).add(RegisterModeChangedIsClicked());
                            },
                            child: Text(
                              'Login',
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
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
