import 'package:flutter/material.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';

class MyHomePage extends StatefulWidget{
  final String name;

  MyHomePage(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text){
    this.setState(() {
      posts.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context){
    // scaffold is a widget
    //scaffold>appBar>text body>text
    return Scaffold(
      appBar: AppBar(title: Text('HELLO WORLD')),
      body: Column(
        children:<Widget>[
          //expanded > child
          Expanded(child: PostList(this.posts)),
          Expanded(child: TextInputWidget(this.newPost))
          ]));
  }
}