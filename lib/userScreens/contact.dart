import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: new EdgeInsets.fromLTRB(50.0,50.0,0.0,0.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Developer Contact :',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
            ),
            Text(
              'savaliyadarshil12884@yahoo.com',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
