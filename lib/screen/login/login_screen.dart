import 'package:flutter/material.dart';
import 'package:to_do_list/screen/home/home_screen.dart';
import 'package:to_do_list/services/auth/auth.dart';

class LoginScreen extends StatelessWidget {
const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(child: Container(child: TextButton(child: const Text('Log In'), onPressed: () async {
      final user = await Auth().signIn();
      if(user != null){
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
      }
    },),));
  }
}