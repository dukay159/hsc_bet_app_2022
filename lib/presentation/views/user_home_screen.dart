import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                      // đường dẫn
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
                      //đường dẫn
                    },
                    child:
                        const Text('Result', style: TextStyle(fontSize: 40))),
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
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
                    onPressed: () {
                      //đường dẫn
                    },
                    child:
                        const Text('Winner', style: TextStyle(fontSize: 40))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
