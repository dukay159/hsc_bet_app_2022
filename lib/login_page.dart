import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Sign in with Google'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          icon: Image.asset(
            'assets/images/google_icon.png',
            height: 32,
            width: 32,
          ),
        ),
      ),
    );
  }
}
