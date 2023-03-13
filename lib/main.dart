import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/todolist/todolist_collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list/screen/home/home_screen.dart';
import 'package:to_do_list/screen/login/login_screen.dart';
import 'package:to_do_list/wrapper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initiData = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initiData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Snapshort has Error'));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<User?>.value(
            initialData: FirebaseAuth.instance.currentUser,
            value: FirebaseAuth.instance.authStateChanges(),
            child: const Wrapper(),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
