import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('demo');
  List<String> users = [
    'Z97539',
    'Z02329',
    'Z02489',
    'Z02490',
    'Z02491',
    'Z02578',
    'Z02580',
    'Z02850',
    'Z02851',
    'Z02897',
    'Z02897',
    'Z02899',
    'Z02900',
    'Z03038',
    'Z03113',
    'Z99999',
  ];

  Stream<QuerySnapshot> getMatches() {
    var timestamp = Timestamp.fromMillisecondsSinceEpoch(
        DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch);
    var timestamp2 = Timestamp.fromMillisecondsSinceEpoch(
        DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch);
    // return collection.where('time' , isEqualTo : '2').snapshots();
    return collection
        .where('timematches', isLessThanOrEqualTo: timestamp2)
        .orderBy('timematches', descending: false)
        .startAt([timestamp]).snapshots();
  }

  Stream<DocumentSnapshot> getVote({required String id, required String user}) {
    return collection.doc(id).collection('votes').doc(user).snapshots();
  }

  Future<void> addMatch({
    required String id,
    required String team1,
    required String team2,
    required DateTime timematches,
  }) {
    return collection
        .doc(id)
        .set({
          'team1': team1,
          'team2': team2,
          'timematches': timematches // 42
        })
        .then((value) {
          for (var user in users) {
            collection.doc(id).collection('votes').doc(user).set({
              'timevote': DateTime.now(),
              'vote': 0,
            });
          }
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // void updateVote(Votes vote) async {
  //   await collection.doc('${vote.id}').update(vote.toJson());
  // }
  Future<void> updateVote({
    required String id,
    required int vote,
    required String user,
  }) {
    return collection
        .doc(id)
        .collection('votes')
        .doc(user)
        .update({
          'vote': vote,
          'timevote': DateTime.now() // 42
        })
        .then((value) => print("User Update"
            "d"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // void Delete(String id) async {
  //   // await collection.doc('${vote.id}').delete();
  //   await collection.doc('${id}').delete();
  // }

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
