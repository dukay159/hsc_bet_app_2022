import 'package:bet_app/presentation/widget/Bet_list_item.dart';
import 'package:bet_app/repo/votes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    final DataRepository repository = DataRepository();
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
        child: FutureBuilder<QuerySnapshot>(
          future: repository.getMatches(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(children: [
                      Text(
                        DateFormat.yMMMEd().format(data['timematches'].toDate()),
                        style: fontstyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: CustomListItem( id: document.id, data: data,),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 201, 187, 191),
                        indent: 20,
                        endIndent: 20,
                      ),
                    ]),
                  );
                }).toList(),
              );
            }

            return const Center(
              child: LinearProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
