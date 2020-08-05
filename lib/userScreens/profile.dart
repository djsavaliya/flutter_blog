import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog/services/app_tools.dart';
import 'package:flutter_blog/services/auth.dart';
import 'homedrawer.dart';

class Profile extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String fName = "";
  String lName = "";
  String mobile = "";
  String email = "";

  @override
  void initState(){
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async{
    fName = await getDataLocally(key: 'fName');
    lName = await getDataLocally(key: 'lName');
    mobile = await getDataLocally(key: 'mobile');
    email = await getDataLocally(key: 'email');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          /*FlatButton.icon(
            icon: Icon(Icons.exit_to_app),
            label: Text("Sign Out"),
            onPressed:() async{
              return await _auth.signOut();
              setState(() {});
            },
          ),*/
        ],
      ),
      drawer: HomeDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text("Name\t:"+fName+"\t"+lName),
            SizedBox(height: 20.0,),
            Text("Mobile\t:"+mobile),
            SizedBox(height: 20.0,),
            Text("Email\t:"+email),
            /*SizedBox(height: 20.0,),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () async {
                await _auth.signOut();
                //setState(() {});
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
