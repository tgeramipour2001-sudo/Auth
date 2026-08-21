import 'package:flutter/material.dart';
import 'package:login/features/login/data/repository/i_login_repository.dart';
import 'package:login/features/login/presentation/login.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: Colors.white70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text('Sign out'),
          Container(
            width:  MediaQuery.sizeOf(context).width /2,
            child: ElevatedButton(
              //style: ButtonStyle(maximumSize: ),
              onPressed: () {
                loginRepository.signOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
              child: Text(
                'Sign out',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
