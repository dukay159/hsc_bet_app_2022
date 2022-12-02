import 'dart:async';

import 'package:bet_app/Utility.dart';
import 'package:bet_app/repo/votes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomListItemResult extends StatefulWidget {
  const CustomListItemResult({
    Key? key,
    required this.id,
    required this.data,
    required this.user,
  }) : super(key: key);

  final String id;
  final String user;
  final dynamic data;

  @override
  State<CustomListItemResult> createState() => _CustomListItemResultState();
}

class _CustomListItemResultState extends State<CustomListItemResult> {
  var fontstyle = const TextStyle(
      fontSize: 15, fontStyle: FontStyle.italic, color: Colors.white);
  var fontstyleTeam = const TextStyle(fontSize: 20, color: Colors.white);

  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: repository.getVote(id: widget.id, user: widget.user),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            Map<String, dynamic> documentFields =
                snapshot.data!.data() as Map<String, dynamic>;
            print(documentFields);
            switch (documentFields['vote']) {
              case 1:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: GestureDetector(
                              onTap: () {
                                if (DateTime.now()
                                    .add(const Duration(hours: 1))
                                    .isBefore((widget.data['timematches']
                                            as Timestamp)
                                        .toDate())) {
                                  repository.updateVote(
                                      id: widget.id,
                                      vote: 1,
                                      user: widget.user);
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Time vote was ended!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Center(
                                child: Visibility(
                                  visible: documentFields['vote'] == 1
                                      ? true
                                      : false,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            nameToImage(widget.data['team1'])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(widget.data['team1'],
                                            style: fontstyleTeam),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                );
              case 0:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: GestureDetector(
                              onTap: () {
                                if (DateTime.now()
                                    .add(const Duration(hours: 1))
                                    .isBefore((widget.data['timematches']
                                            as Timestamp)
                                        .toDate())) {
                                  repository.updateVote(
                                      id: widget.id,
                                      vote: 0,
                                      user: widget.user);
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Time vote was ended!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Center(
                                child: Visibility(
                                  visible: documentFields['vote'] == 0
                                      ? true
                                      : false,
                                  child: Column(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/x-mark-5-64.png"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child:
                                            Text('Draw', style: fontstyleTeam),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                );
              case 2:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: GestureDetector(
                              onTap: () {
                                if (DateTime.now()
                                    .add(const Duration(hours: 1))
                                    .isBefore((widget.data['timematches']
                                            as Timestamp)
                                        .toDate())) {
                                  repository.updateVote(
                                      id: widget.id,
                                      vote: 2,
                                      user: widget.user);
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Time vote was ended!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Center(
                                child: Visibility(
                                  visible: documentFields['vote'] == 2
                                      ? true
                                      : false,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            nameToImage(widget.data['team2'])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(widget.data['team2'],
                                            style: fontstyleTeam),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                );

              default:
                return Container();
            }
          }
        });
  }
}
