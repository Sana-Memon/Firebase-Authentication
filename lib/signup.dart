import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController userName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            TextFormField(
              controller: userName,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),
            TextFormField(
              controller: age,
              decoration: InputDecoration(
                labelText: "Age",
              ),
              obscureText: true,
            ),
            TextFormField(
              controller: gender,
              decoration: const InputDecoration(
                labelText: "gender",
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text("Signup"),
              onPressed: () async {
                await RegisterUser();
                AddUsers();
              },
            ),
          ],
        ),
      ),
    );
  }

  RegisterUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  AddUsers() async {
    CollectionReference ref = FirebaseFirestore.instance.collection("Users");
    await ref.add({
      "Email": email.text,
      "Password": password.text,
      "UserName": userName.text,
      "Age": age.text,
      "Gender": gender.text
    });
  }
}
