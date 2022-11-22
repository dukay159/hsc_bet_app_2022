import 'package:bet_app/model/acc.dart';
import 'package:bet_app/presentation/views/user_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();
  bool check = false;
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/005/545/348/non_2x/football-qatar-2022-tournament-background-illustration-football-pattern-for-banner-card-website-burgundy-color-national-flag-qatar-world-cup-2022-vector.jpg'),
                fit: BoxFit.cover)),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "WorldCup 2022",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Zensho HSC",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Email")),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                    controller: _passWordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "PassWord")),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: _login,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              )),
          check
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 40,
                    color: Colors.red,
                    child: Text(
                      'Enter the wrong email or password',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              : Container()
        ])),
      )),
    );
  }

  _login() {
    var emailSuccessful = accounts.firstWhere(
        (element) => element.email == _emailController.text,
        orElse: () => accounts.elementAt(0));

    var passSuccessful = accounts.firstWhere(
        (element) => element.pass == _passWordController.text,
        orElse: () => accounts.elementAt(0));

    if (emailSuccessful.email == _emailController.text &&
        passSuccessful.pass == _passWordController.text) {
      setState(() {
        check = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserScreen(email: _emailController.text)));
    } else {
      setState(() {
        check = true;
      });
    }
  }
}
