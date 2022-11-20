import 'package:bet_app/presentation/widget/date_time_picker.dart';
import 'package:bet_app/presentation/widget/team_picker.dart';
import 'package:flutter/material.dart';
class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
          flexibleSpace: const Image(
            image: AssetImage('assets/images/bgr_worldcup.png'),
            fit: BoxFit.cover,
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 93, 34, 59),
            child: SingleChildScrollView(
              child: Column(children: [
                DateTimePicker(),
                TeamPicker(),
              ]),
            )));
  }
}