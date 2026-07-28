import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/repository/login_repository.dart';
import 'package:login/ui/home.dart';
import 'package:login/ui/login/bloc/login_bloc.dart';

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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {

              if(state is LoginSuccess){return Container();}
              else 
             if (state is LoginInitial ||
                  state is LoginLoading ||
                  state is LoginError) {
                return SingleChildScrollView(
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
                              Text(
                                state.login ? 'Login' : 'Register',
                                style: theme.textTheme.headlineLarge,
                              ),
                              SizedBox(height: 30),

                              //username
                              Text(
                                state.login ? 'Username' : 'Email',
                                style: theme.textTheme.titleMedium,
                              ),
                              SizedBox(height: 10),
                              _UsernameTextField(_usernameController),

                              SizedBox(height: 20),
                              //password
                              Text(
                                'Password',
                                style: theme.textTheme.titleMedium,
                              ),
                              SizedBox(height: 10),
                              _passwordTextField(_passwordController),

                              SizedBox(height: 20),
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
                                  context.read<LoginBloc>().add(
                                    LoginButtonClicked(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                },
                                child: state is LoginLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : Text(
                                        state.login ? 'Sign in' : 'Sign up',
                                        style: theme.textTheme.headlineMedium,
                                      ),
                              ),

                              //SizedBox(height: 150),
                              const Spacer(),
                              //register
                              Row(
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
                                      child: Text(
                                        state.login ? 'Register' : 'Login',
                                        style: theme.textTheme.titleSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                throw Exception('state is invalid');
              }
            },
          ),
        ),
      ),
    );
  }
}

class _UsernameTextField extends StatelessWidget {
  final TextEditingController textController;
  _UsernameTextField(this.textController);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        labelText: 'username',
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}

class _passwordTextField extends StatefulWidget {
  final TextEditingController textController;
  _passwordTextField(this.textController);

  @override
  State<_passwordTextField> createState() => _passwordTextFieldState();
}

class _passwordTextFieldState extends State<_passwordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off_outlined,
          ),
        ),
        labelText: 'password',

        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
