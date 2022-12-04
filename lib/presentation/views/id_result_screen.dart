import 'package:bet_app/presentation/widget/Bet_list_item.dart';
import 'package:bet_app/presentation/widget/SelectIdDrop.dart';
import 'package:bet_app/presentation/widget/button_done.dart';
import 'package:bet_app/repo/votes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IdVoteResultScreen extends StatefulWidget {
  const IdVoteResultScreen({Key? key, this.onTap, this.email})
      : super(key: key);

  final onTap;
  final String? email;

  @override
  State<IdVoteResultScreen> createState() => _IdVoteResultScreenState();
}

class _IdVoteResultScreenState extends State<IdVoteResultScreen> {
  String? team1;
  bool isButtonPressed = false;
  void buttonPressed() {}

  DateTime now = DateTime.now();
  late String formattedDate;
  var fontstyleID = const TextStyle(
      fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold);
  var fontstyle = const TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.italic,
      color: Colors.white,
      fontWeight: FontWeight.bold);
  var fontstyleTeam =
      const TextStyle(fontSize: 20, color: Color.fromARGB(255, 202, 200, 200));

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat.yMMMEd().format(now);
  }

  @override
  Widget build(BuildContext context) {
    final DataRepository repository = DataRepository();
    return Scaffold(
      appBar: AppBar(
        title: const Text('WC 2022'),
        flexibleSpace: const Image(
          image: AssetImage('assets/images/bgr_worldcup.png'),
          fit: BoxFit.cover,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_app.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3.0, color: Colors.white),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: SelectIdDropdown(
                        onChanged: (value) {
                          setState(() {
                            team1 = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 3.0, color: Colors.white),
                        // color: Color.fromARGB(255, 193, 30, 79)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: (Color.fromRGBO(53, 184, 172, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Team 1 Win',
                                    style: fontstyleID,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Doan Huy Duc',
                                style: fontstyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 3.0, color: Colors.white),
                        // color: Color.fromARGB(255, 193, 30, 79)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: (Color.fromRGBO(53, 184, 172, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'DRAW',
                                    style: fontstyleID,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Doan Huy Duc',
                                style: fontstyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 3.0, color: Colors.white),
                        // color: Color.fromARGB(255, 193, 30, 79)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: (Color.fromRGBO(53, 184, 172, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Team 2 Win',
                                    style: fontstyleID,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Doan Huy Duc',
                                style: fontstyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
