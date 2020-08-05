import 'package:firebase_database/firebase_database.dart';


class BlogService{
  String nodeName = "blogs";
  FirebaseDatabase database = FirebaseDatabase.instance;
  Map blog;

  BlogService(this.blog);

  addBlog(){
    database.reference().child(nodeName).push().set(blog);
  }

  deleteBlog(){
    database.reference().child('$nodeName/${blog['key']}').remove();
  }

  updateBlog(){
    database.reference().child('$nodeName/${blog['key']}').update(
        {"title": blog['title'], "body": blog['body'], "date":blog['date']}
    );
  }
}