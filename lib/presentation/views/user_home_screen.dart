import 'package:bet_app/presentation/views/user_screen.dart';
import 'package:flutter/material.dart';

import '../widget/button_logout.dart';
import 'id_result_screen.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key, this.email}) : super(key: key);
  final String? email;
  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/images/bg_app.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xff35b8ac)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserScreen(email:  widget.email!))
                  );
                },
                child: const Text('Vote', style: TextStyle(fontSize: 40))),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xff35b8ac)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))),
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IdVoteResultScreen ())
                  );                   },
                child:
                const Text('Result', style: TextStyle(fontSize: 40))),
          ),
          const SizedBox(
            height: 100,
          ),
          ButtonLogOut(),
        ],
      ),
    ),
    ),
    );
  }
}
//email: _emailController.text