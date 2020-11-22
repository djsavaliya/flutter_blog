import 'package:flutter_blog/userScreens/authentication/authenticate.dart';
import 'package:flutter_blog/models/user.dart';
import 'package:flutter_blog/userScreens/profile.dart';
import 'blogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if(user == null){
      return Authenticate();
    }
    else{
      return Blogs();
    }
  }
}
