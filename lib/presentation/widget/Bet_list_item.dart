import 'dart:async';

import 'package:bet_app/Utility.dart';
import 'package:bet_app/repo/votes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

typedef OnChangeCallback = void Function(dynamic value);
class CustomListItem extends StatefulWidget {
  const CustomListItem({
    Key? key,
    required this.id,
    required this.data, required this.function,
  }) : super(key: key);

  final String id;
  final dynamic data;
  final OnChangeCallback function;

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  var fontstyle = const TextStyle(
      fontSize: 15, fontStyle: FontStyle.italic, color: Colors.white);
  var fontstyleTeam = const TextStyle(fontSize: 20, color: Colors.white);

  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: repository.getVote(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            Map<String, dynamic> documentFields =
                snapshot.data!.data() as Map<String, dynamic>;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: 60,
                        height: 60,
                        child: GestureDetector(
                          onTap: () {
                            if (DateTime.now().isBefore(
                                (widget.data['timematches'] as Timestamp)
                                    .toDate())) {
                              repository.updateVote(id: widget.id, vote: 1);
                            }else{
                              const snackBar = SnackBar(
                                content: Text('Time vote ended!'),
                              );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                widget.function;
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: documentFields['vote'] == 1
                                      ? [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 250, 240, 240),
                                            offset: const Offset(6, 2),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          ),
                                          const BoxShadow(
                                            color: Color.fromARGB(
                                                255, 250, 240, 240),
                                            offset: Offset(-6, -2),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          )
                                        ]
                                      : []),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    nameToImage(widget.data['team1'])),
                              )),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(widget.data['team1'], style: fontstyleTeam),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        width: 60,
                        height: 60,
                        child: GestureDetector(
                          onTap: () {
                            if (DateTime.now().isBefore(
                                (widget.data['timematches'] as Timestamp)
                                    .toDate())) {
                              repository.updateVote(id: widget.id, vote: 0);
                            }else{
                              const snackBar = SnackBar(
                                content: Text('Time vote was ended!'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              widget.function;
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: documentFields['vote'] == 0
                                      ? [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 250, 240, 240),
                                            offset: const Offset(6, 2),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          ),
                                          const BoxShadow(
                                            color: Color.fromARGB(
                                                255, 250, 240, 240),
                                            offset: Offset(-6, -2),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          )
                                        ]
                                      : []),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/x-mark-5-64.png"),
                              )),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(' ', style: fontstyleTeam),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        width: 60,
                        height: 60,
                        child: GestureDetector(
                          onTap: () {
                            if (DateTime.now().isBefore(
                                (widget.data['timematches'] as Timestamp)
                                    .toDate())) {
                              repository.updateVote(id: widget.id, vote: 2);
                            }else{
                              const snackBar = SnackBar(
                                content: Text('Time vote was ended!'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              widget.function;
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: documentFields['vote'] == 2
                                      ? [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 250, 240, 240),
                                            offset: const Offset(6, 2),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          ),
                                          const BoxShadow(
                                            color: Color.fromARGB(
                                                255, 250, 240, 240),
                                            offset: Offset(-6, -2),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          )
                                        ]
                                      : []),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    nameToImage(widget.data['team2'])),
                              )),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(widget.data['team2'], style: fontstyleTeam),
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
