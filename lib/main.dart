import 'package:firebase_authentication/choose_account.dart';
import 'package:firebase_authentication/firebase_options.dart';
import 'package:firebase_authentication/signin.dart';
import 'package:firebase_authentication/signup.dart';
import 'package:firebase_authentication/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChooseAccount(),
    );
  }
}
