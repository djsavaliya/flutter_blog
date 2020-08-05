import 'dart:io';
import 'dart:async';

import 'package:flutter_blog/userScreens/blogs.dart';
import 'package:flutter_blog/userScreens/profile.dart';
import 'package:flutter_blog/userScreens/settings.dart';

import 'userScreens/wrapper.dart';
import 'services/auth.dart';
import 'models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: { //route setting
          '/blogs': (context) => Blogs(),
          '/profile': (context) => Profile(),
          '/settings': (context) => Settings(),
        },
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}