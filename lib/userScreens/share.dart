import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: new EdgeInsets.fromLTRB(50.0,50.0,0.0,0.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Github Project Link :',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            SelectableText(
              'https://github.com/djsavaliya/flutter_blog',
              style: TextStyle(fontSize: 17.0),
            ),
            Padding(padding: new EdgeInsets.all(25.0)),
            Text(
              'Play Store Link Coming Soon...',
              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
