import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp (MyApp());
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
  String text = " ";

  void changeText(String text){
    this.setState(() {
    this.text = text;
    });
  }

  @override
  Widget build(BuildContext context){
    // scaffold is a widget
    //scaffold>appBar>text body>text
    return Scaffold(
      appBar: AppBar(title: Text('Hello World')),
      body: Column(
        children:<Widget>[
          TextInputWidget(this.changeText), 
          Text(this.text)]
          )
          );
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
  widget.callback(controller.text);
  controller.clear();

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

