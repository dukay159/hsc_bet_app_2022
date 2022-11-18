import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bet_app/model/appModel.dart';

class DataRepository {
  // 1
  final CollectionReference collection =
  FirebaseFirestore.instance.collection('votes');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }
  // 3
  // Future<DocumentReference> addVote(Votes votes) {
  //   return collection.add(votes.toJson());
  // }
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return collection.doc('123')
        .set({
      'id': 1, // John Doe
      'userId': 1, // Stokes and Sons
      'vote': 1,
      'matchTime': DateTime.now(),
      'timeVote': DateTime.now()// 42
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  // 4
  // void updateVote(Votes vote) async {
  //   await collection.doc('${vote.id}').update(vote.toJson());
  // }
  Future<void> updateUser() {
    return collection
        .doc('123')
        .update({'id': 2})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  // 5
  void deleteVote(String id) async {
    // await collection.doc('${vote.id}').delete();
    await collection.doc('${id}').delete();
  }
}
