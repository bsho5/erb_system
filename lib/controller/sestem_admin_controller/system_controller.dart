import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserDataController with ChangeNotifier {
  List suppliersData = [];

  void addUser(
      {required String email,
      required String name,
      required String management,
      required String password}) async {
    await FirebaseFirestore.instance.collection('UserData').doc(email).set({
      'name': name,
      "management": management,
      'email': email,
      "password": password,
      'date': DateTime.now().toIso8601String().toString()
    });
  }

  getUser() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("UserData").get();
    return qn.docs;
  }
}
