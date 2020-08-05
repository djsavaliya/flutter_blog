import 'dart:io';
import 'dart:async';

import 'package:flutter_blog/models/user.dart';
import 'package:flutter_blog/services/app_tools.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference userData = Firestore.instance.collection('users');

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  //Anonymous Sign In
  /*Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }*/

  //register with email password
  Future registerWithEmailAndPassword(String fName,String lName,String email,String mobile,String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      writeDataLocally(key: 'fName', value: fName);
      writeDataLocally(key: 'lName', value: lName);
      writeDataLocally(key: 'mobile', value: mobile);
      writeDataLocally(key: 'email', value: email);
      writeDataLocally(key: 'password', value: password);

      return await userData.document(user.uid).setData({
        'fName': fName,
        'lName': lName,
        'mobile': mobile,
        'email': email,
        'password': password,
      });

      //return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email password
  Future signInWithEmailAndPassword(String email,String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      DocumentSnapshot userInfo = await getUserInfo(user.uid);
      await writeDataLocally(key: 'fName', value: userInfo['fName']);
      await writeDataLocally(key: 'lName', value: userInfo['lName']);
      await writeDataLocally(key: 'mobile', value: userInfo['mobile']);
      await writeDataLocally(key: 'email', value: userInfo['email']);
      await writeDataLocally(key: 'password', value: userInfo['password']);

      print(userInfo['fName']);

      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      await removeValues();
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<DocumentSnapshot> getUserInfo(uid) async {
    return await userData.document(uid).get();
  }

}