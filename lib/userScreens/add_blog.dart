import 'package:flutter_blog/services/blog_database.dart';
import 'package:flutter_blog/models/blog.dart';
import 'package:flutter_blog/userScreens/blogs.dart';
import 'package:flutter/material.dart';

class AddBlog extends StatefulWidget {
  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  Blog blog = Blog(0, " ", " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add blog"),
        elevation: 0.0,
      ),
      body: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Blog title",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => blog.title = val,
                  validator: (val){
                    if(val.isEmpty ){
                      return "title field cant be empty";
                    }else if(val.length > 16){
                      return "title cannot have more than 16 characters ";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Blog body",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => blog.body = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "body field cant be empty";
                    }
                  },
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        insertBlog();
        Navigator.pop(context);
//        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.red,
        tooltip: "add a blog",),
    );
  }

  void insertBlog() {
    final FormState form = formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      blog.date = DateTime.now().millisecondsSinceEpoch;
      BlogService blogService = BlogService(blog.toMap());
      blogService.addBlog();
    }
  }



}
