import 'package:bet_app/Utility.dart';
import 'package:bet_app/presentation/widget/SelectIdDrop.dart';
import 'package:bet_app/repo/votes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IdVoteResultScreen extends StatefulWidget {
  const IdVoteResultScreen({Key? key})
      : super(key: key);

  @override
  State<IdVoteResultScreen> createState() => _IdVoteResultScreenState();
}

class _IdVoteResultScreenState extends State<IdVoteResultScreen> {
  String? id;
  bool isButtonPressed = false;
  List<String> vote1 = [];
  List<String> vote2 = [];
  List<String> vote0 = [];

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

  final DataRepository repository = DataRepository();

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat.yMMMEd().format(now);
  }

  @override
  Widget build(BuildContext context) {
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
                            id = value;
                            vote0=[];
                            vote1 = [];
                            vote2 =[];
                            repository.collection.doc(id).collection('votes')
                                .get()
                                .then((QuerySnapshot querySnapshot) {
                              querySnapshot.docs.forEach((doc) {
                                if(doc['vote'] == 2){
                                  vote2.add(doc.id);
                                }
                                if(doc['vote'] == 0){
                                  vote0.add(doc.id);
                                }
                                if(doc['vote'] == 1){
                                  vote1.add(doc.id);
                                }
                              });
                            });
                          });
                        },
                      ),
                    ),
                  ),
                  id != null ? FutureBuilder<DocumentSnapshot>(
                    future: repository.collection.doc(id).get(),
                    builder:
                        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        return Column(children: [
                          vote1.isNotEmpty ? Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
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
                                            "${data['team1']}",
                                            style: fontstyleID,
                                          ),
                                        )),
                                    ...vote1.map((e) => Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        idUser(e),
                                        style: fontstyle,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ): Container(),
                          vote0.isNotEmpty ?Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
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
                                    ...vote0.map((e) => Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        idUser(e),
                                        style: fontstyle,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ): Container(),
                          vote2.isNotEmpty?Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
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
                                            "${data['team2']}",
                                            style: fontstyleID,
                                          ),
                                        )),
                                    ...vote2.map((e) => Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        idUser(e),
                                        style: fontstyle,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ): Container(),
                        ],);
                      }

                      return Text("loading");
                    },
                  ): Container()

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget VoteContainer(int vote){
    return FutureBuilder<QuerySnapshot>(
      future: repository.collection.doc(id).collection('votes').get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (!snapshot.hasData) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
          print(data['votes']);
          return Column(children: [
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
                              "${data['team1']} Win",
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
                              "${data['team2']} Win",
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
          ],);
        }

        return Text("loading");
      },
    );
  }
}
