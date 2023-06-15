//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firestone_app/src/models/user_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider extends ChangeNotifier {
  Future addUserDetails(UserLog user) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': user.email,
      'age': user.age,
    });
  }
}
