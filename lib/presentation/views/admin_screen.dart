import 'package:bet_app/Utility.dart';
import 'package:bet_app/presentation/widget/date_time_picker.dart';
import 'package:bet_app/presentation/widget/SelectTeamDropdown.dart';
import 'package:bet_app/repo/votes.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String? team1, team2;
  DateTime? timeMatch;
  TextEditingController idMatchController = TextEditingController();

  var fontstyle = const TextStyle(fontSize: 20, color: Colors.white);
  var fontstyleTeam = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);

  final DataRepository repository = DataRepository();

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
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: const Color.fromARGB(255, 93, 34, 59),
            child: SingleChildScrollView(
              child: Column(children: [
                DateTimePicker(onChanged: (value) {
                  timeMatch = value;
                },),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: idMatchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Id: BRZ-BRZ-21-11',
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 40.0, top: 20, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Team 1',
                        style: fontstyleTeam,
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 2.0, color: Color(0xFFFF7F7F7F)),
                          // color: Color.fromARGB(255, 193, 30, 79)
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Name: ',
                                  style: fontstyle,
                                ),
                                DropdownButtonHideUnderline(
                                  child: SelectTeamDropdown(
                                    onChanged: (value) {
                                      setState(() {
                                        team1 = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Image:',
                                  style: fontstyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 10.0),
                                  child: Image.asset(nameToImage(team1),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          'Team 2',
                          style: fontstyleTeam,
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 2.0, color: Color(0xFFFF7F7F7F)),
                          // color: Color.fromARGB(255, 193, 30, 79)
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Name: ',
                                  style: fontstyle,
                                ),
                                DropdownButtonHideUnderline(
                                  child: SelectTeamDropdown(
                                    onChanged: (value) {
                                      setState(() {
                                        team2 = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Image:',
                                  style: fontstyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 10.0),
                                  child: Image.asset(nameToImage(team2),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 130,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                if (team1 != null && team2 != null &&
                                    timeMatch != null && idMatchController.text
                                    .isNotEmpty) {
                                  repository.addMatch(id: idMatchController.text,
                                      team1: team1!,
                                      team2: team2!,
                                      timematches: timeMatch!);
                                }
                              },
                              child: Text('SAVE'))),
                      SizedBox(
                          width: 130,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () => {}, child: Text('CANCEL'))),
                    ],
                  ),
                )
              ]),
            )));
  }
}
