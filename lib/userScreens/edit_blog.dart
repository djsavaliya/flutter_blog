import 'package:flutter_blog/services/blog_database.dart';
import 'package:flutter_blog/models/blog.dart';
import 'package:flutter_blog/userScreens/blogs.dart';
import 'package:flutter/material.dart';

class EditBlog extends StatefulWidget {
  final Blog blog;

  EditBlog(this.blog);

  @override
  _EditBlogState createState() => _EditBlogState();
}

class _EditBlogState extends State<EditBlog> {
  final GlobalKey<FormState> formkey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit blog"),
        elevation: 0.0,
      ),
      body: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.blog.title,
                  decoration: InputDecoration(
                      labelText: "Blog tilte",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.blog.title = val,
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
                  initialValue: widget.blog.body,
                  decoration: InputDecoration(
                      labelText: "Blog body",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.blog.body = val,
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
//        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Blogs()));
      },
        child: Icon(Icons.edit, color: Colors.white,),
        backgroundColor: Colors.red,
        tooltip: "exit a blog",),
    );
  }

  void insertBlog() {
    final FormState form = formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      widget.blog.date = DateTime.now().millisecondsSinceEpoch;
      BlogService blogService = BlogService(widget.blog.toMap());
      blogService.updateBlog();
    }
  }


}