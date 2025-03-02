import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp (MyApp());
}

//start listView
class Post{
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost(){
    this.userLiked = !this.userLiked;
    if(this.userLiked){
      this.likes += 1;
    } else{
      this.likes -= 1;
    }
  }
}

//statelesswidget means not going to change
class MyApp extends StatelessWidget{
  //this widget is root of your app.
  @override
  //widget just properties (row/ column wedgit )
  Widget build(BuildContext context){
  return MaterialApp(
    title: 'Tims App',
    theme: ThemeData(

      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyHomePage(),
  );
  }
}

//buat homepage
class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text){
    this.setState(() {
      posts.add(new Post(text, "Qash"));
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

//stateful widget and text input
class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  //define callback > optial name parameter
  TextInputWidget(this.callback);

  @override
  _TextInputWidget createState() => _TextInputWidget();
}

class _TextInputWidget extends State<TextInputWidget> {
final controller = TextEditingController();

//cleaning up the object
@override
void dispose(){
  super.dispose();
  controller.dispose();
}

void click(){
  FocusScope.of(context).unfocus();
  controller.clear();
  widget.callback(controller.text);
}

  @override
  Widget build(BuildContext context) {
    return  
      TextField(
      controller: this.controller,
      decoration: InputDecoration(
      //icon is widget
      prefixIcon: Icon(Icons.message), labelText: "Type a message:", 
      //button presses
      suffixIcon: IconButton(
      icon: Icon(Icons.send),
      //jenis-jenis
      splashColor: Colors.blue,
      tooltip: "Post message",
      //empty func
      onPressed: this.click,
      )));
  }
}

//new untuk topic listView part 1
class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback){
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: this.widget.listItems.length,
    itemBuilder: (context, index){
      //post defined can simply access attributes of post like body
      var post = this.widget.listItems[index];

      return Card(
        child: Row(children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text(post.body),
              subtitle: Text(post.author),
            )),

            Row(
              children: <Widget>[
                Container(
                  child: Text(post.likes.toString(),
                  style: TextStyle(fontSize: 30)),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed:()=> this.like(post.likePost),
                color: post.userLiked ?
                //macam if else statement
                Colors.green : Colors.black

                )
            ],)
        ])
        );
    },
    );
  }
}