import 'package:bet_app/presentation/widget/Bet_list_item.dart';
import 'package:bet_app/presentation/widget/button_done.dart';
import 'package:bet_app/repo/votes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widget/Bet_list_item_result.dart';

class VoteResultScreen extends StatefulWidget {
  const VoteResultScreen({Key? key, this.onTap, this.email}) : super(key: key);

  final onTap;
  final String? email;
  @override
  State<VoteResultScreen> createState() => _VoteResultScreenState();
}

class _VoteResultScreenState extends State<VoteResultScreen> {
  bool isButtonPressed = false;
  void buttonPressed() {}

  DateTime now = DateTime.now();
  late String formattedDate;
  var fontstyleID = const TextStyle(
      fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold);
  var fontstyle = const TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.italic,
      color: Color.fromARGB(255, 202, 200, 200));
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
        title: const Text('VOTED'),
        flexibleSpace: const Image(
          image: AssetImage('assets/images/bgr_worldcup.png'),
          fit: BoxFit.cover,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_app.jpg'), fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // child: Text('data'),
        child: StreamBuilder<QuerySnapshot>(
          stream: repository.getMatches(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                      'GROUP ${document.id.substring(0, document.id.indexOf('-'))}',
                                      style: fontstyleID),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      ' ${DateFormat.Hm().format(data['timematches'].toDate())} - ${DateFormat.d().format(data['timematches'].toDate())}/${DateFormat.M().format(data['timematches'].toDate())}/${DateFormat.y().format(data['timematches'].toDate())} ',
                                      style: fontstyle,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: CustomListItemResult(
                                    id: document.id,
                                    data: data,
                                    user: widget.email!),
                              ),
                            ]),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 201, 187, 191),
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
