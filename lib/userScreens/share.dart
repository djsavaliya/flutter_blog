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
      body: Center(
        child: Text('Link Coming Soon...'),
      ),
    );
  }
}
