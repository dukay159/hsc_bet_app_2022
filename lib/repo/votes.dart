import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bet_app/model/appModel.dart';
import 'package:flutter/material.dart';

class DataRepository {
  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('demo');

  // 2
  Future<QuerySnapshot> getMatches() {
    var timestamp = Timestamp.fromMillisecondsSinceEpoch(DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch);
    // return collection.where('time' , isEqualTo : '2').snapshots();
    return collection .orderBy('timematches', descending: false).startAt([timestamp]).get();
  }

  Stream<DocumentSnapshot> getVote({required String id}) {
    return collection
        .doc(id)
        .collection('votes')
        .doc('dung@gmail.com')
        .snapshots();
  }

  // 3
  // Future<DocumentReference> addVote(Votes votes) {
  //   return collection.add(votes.toJson());
  // }
  Future<void> addUser({
    required String id,
    required String vote,
  }) {
    // Call the user's CollectionReference to add a new user
    return collection
        .doc(id)
        .collection('votes')
        .doc('dung@gmail.com')
        .set({
          'vote': vote,
          'timeVote': DateTime.now() // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // 4
  // void updateVote(Votes vote) async {
  //   await collection.doc('${vote.id}').update(vote.toJson());
  // }
  Future<void> updateVote({
    required String id,
    required int vote,
  }) {
    return collection
        .doc(id)
        .collection('votes')
        .doc('dung@gmail.com')
        .update({
          'vote': vote,
          'timevote': DateTime.now() // 42
        })
        .then((value) => print("User Update"
            "d"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // 5
  void deleteVote(String id) async {
    // await collection.doc('${vote.id}').delete();
    await collection.doc('${id}').delete();
  }

  Future<void> batchDelete() async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    FirebaseFirestore.instance.collection("11222").get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        print(document.id);
      });
      return batch.commit();
    });
  }
}
