import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog/services/auth.dart';
import 'homedrawer.dart';

class Settings extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blue,
        /*actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.exit_to_app),
            label: Text("Sign Out"),
            onPressed:() async{
              await _auth.signOut();
              setState(() {});
            },
          )
        ],*/
      ),
      drawer: HomeDrawer(),
      body: Center(
          child: Text("User can Change App Settings from Here"),
      ),
    );
  }
}
