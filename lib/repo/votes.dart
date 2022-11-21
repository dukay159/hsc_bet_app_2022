import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('demo');
  List<String> users = [
    'bui.van.khoi@zensho.com',
    'hoang.dinh.chien@zensho.com',
    'khuat.quang.giang@zensho.com',
    'le.quang.anh@zensho.com',
    'le.thi.lan.huong@zensho.com',
    'luong.minh.trang@zensho.com',
    'nguyen.anh.van@zensho.com',
    'nguyen.cam.linh@zensho.com',
    'nguyen.ngoc.diep@zensho.com',
    'nguyen.viet.dung@zensho.com',
    'hsc.admin@zensho.com',
    'tran.minh.hung@zensho.com',
    'hsc.admin@zensho.com',
    'vu.thi.kim.tuyen@zensho.com',
    'doan.huy.duc@zensho.com',
    'dang.le.duc.anh@zensho.com',
  ];

  Future<QuerySnapshot> getMatches() {
    var timestamp = Timestamp.fromMillisecondsSinceEpoch(
        DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch);
    // return collection.where('time' , isEqualTo : '2').snapshots();
    return collection.orderBy('timematches', descending: false).startAt([timestamp]).get();
  }

  Stream<DocumentSnapshot> getVote({required String id}) {
    return collection
        .doc(id)
        .collection('votes')
        .doc('nguyen.viet.dung@zensho.com')
        .snapshots();
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
  }) {
    return collection
        .doc(id)
        .collection('votes')
        .doc('nguyen.viet.dung@zensho.com')
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
