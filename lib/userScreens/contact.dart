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
      body: Center(
        child: Text('Developer Contact : savaliyadarshil12884@yahoo.com'),
      ),
    );
  }
}
