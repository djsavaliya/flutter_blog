import 'dart:io';
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/models/blog.dart';
import 'package:flutter_blog/services/auth.dart';
import 'package:flutter_blog/userScreens/view_blog.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_blog/userScreens/add_blog.dart';
import 'package:flutter_blog/userScreens/homedrawer.dart';

class Blogs extends StatelessWidget {
  static const String routeName = '/blogs';
  @override
  Widget build(BuildContext context) {
    //if got bicycle
    return Live();
    //else return goto ride page button
  }
}

class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "blogs";
  List<Blog> blogsList = <Blog>[];
  final AuthService _auth = AuthService();

  @override
  void initState() {
    _database
        .reference()
        .child(nodeName)
        .onChildAdded
        .listen(_childAdded);
    _database
        .reference()
        .child(nodeName)
        .onChildRemoved
        .listen(_childRemoved);
    _database
        .reference()
        .child(nodeName)
        .onChildChanged
        .listen(_childChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs"),
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
      body: Container(
        child: Column(
          children: <Widget>[
            Visibility(
              visible: blogsList.isEmpty,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

            Visibility(
              visible: blogsList.isNotEmpty,
              child: Flexible(
                  child: FirebaseAnimatedList(
                      query: _database.reference().child('blogs'),
                      itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.greenAccent,
                            child: ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BlogView(blogsList[index])));
                              },
                              title: ListTile(
                                title: Text(
                                  blogsList[index].title,
                                  style: TextStyle(
                                      fontSize: 25.0, fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  timeago.format(DateTime.fromMillisecondsSinceEpoch(blogsList[index].date)),
                                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(blogsList[index].body, style: TextStyle(fontSize: 18.0),),
                              ),
                            ),
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBlog()));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        tooltip: "add a blog",
      ),
    );
  }

  _childAdded(Event event) {
    setState(() {
      blogsList.add(Blog.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoved(Event event) {
    var deletedBlog = blogsList.singleWhere((blog){
      return blog.key == event.snapshot.key;
    });

    setState(() {
      blogsList.removeAt(blogsList.indexOf(deletedBlog));
    });
  }

  void _childChanged(Event event) {
    var changedBlog = blogsList.singleWhere((blog){
      return blog.key == event.snapshot.key;
    });

    setState(() {
      blogsList[blogsList.indexOf(changedBlog)] = Blog.fromSnapshot(event.snapshot);
    });
  }
}


