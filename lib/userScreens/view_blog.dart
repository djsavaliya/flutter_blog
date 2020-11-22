import 'package:flutter_blog/models/blog.dart';
import 'package:flutter_blog/userScreens/edit_blog.dart';
import 'package:flutter_blog/userScreens/blogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/services/blog_database.dart';
import 'package:timeago/timeago.dart' as timeago;

class BlogView extends StatefulWidget {
  final Blog blog;

  BlogView(this.blog);

  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    timeago.format(DateTime.fromMillisecondsSinceEpoch(widget.blog.date)),
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),),
              IconButton(icon: Icon(Icons.delete),
                onPressed: (){
                  BlogService blogService = BlogService(widget.blog.toMap());
                  blogService.deleteBlog();
                  Navigator.pop(context);

                },),
              IconButton(icon: Icon(Icons.edit),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditBlog(widget.blog)));
                },),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.blog.body),
          ),
        ],
      ),
    );
  }
}