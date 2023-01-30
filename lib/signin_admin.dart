import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/add_product_admin.dart';
import 'package:firebase_authentication/login_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: loginEmailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              controller: loginPasswordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text("Sign In"),
              onPressed: () async {
                await SignInAdmin(
                    loginEmailController, loginPasswordController, context);
              },
            ),
          ],
        ),
      ),
    );
  }

  SignInAdmin(loginEmailController, loginPasswordController, context) async {
    if (loginEmailController.text == "aaa@aaa.com") {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: loginEmailController.text,
                password: loginPasswordController.text);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddProductForAdmin()),
        );
        print("login Successful");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print("you seems to be a user, not an admin");
    }
  }
}
