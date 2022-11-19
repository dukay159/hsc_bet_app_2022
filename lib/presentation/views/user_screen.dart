import 'package:bet_app/widget/new_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key, this.onTap}) : super(key: key);

  final onTap;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // List<int> list = [1, 2, 3];
  bool isButtonPressed = false;
  void buttonPressed() {}

  DateTime now = DateTime.now();
  late String formattedDate;
  var fontstyle = const TextStyle(
      fontSize: 15, fontStyle: FontStyle.italic, color: Colors.white);
  var fontstyleTeam = const TextStyle(fontSize: 20, color: Colors.white);
  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat.yMMMEd().format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BetWinner'),
          flexibleSpace: const Image(
            image: AssetImage('assets/images/bgr_worldcup.png'),
            fit: BoxFit.cover,
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 93, 34, 59),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(children: [
                Text(
                  formattedDate,
                  style: fontstyle,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: NewButton(),
                ),
              ]),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 201, 187, 191),
              indent: 20,
              endIndent: 20,
            ),
          ),
        ));
  }
}
