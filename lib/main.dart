import 'package:flutter/material.dart';

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
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    // scaffold is a widget
    //scaffold>appBar>text body>text
    return Scaffold(
      appBar: AppBar(title: Text('Hello World')),
      body: TextInputWidget()
    );
  }
}

//stateful widget and text input
class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidget createState() => _TextInputWidget();
}

class _TextInputWidget extends State<TextInputWidget> {
final controller = TextEditingController();
String text = "";

//cleaning up the object
@override
void dispose(){
  super.dispose();
  controller.dispose();
}

void changeText(text){
  if(text == "Hello World!"){
    controller.clear();
    text = " ";
  }
  setState((){
    this.text = text;
  });
}


  @override
  Widget build(BuildContext context) {
    return  Column(children: <Widget>[
      TextField(
      controller: this.controller,
      decoration: InputDecoration(
      //icon is widget
      prefixIcon: Icon(Icons.message), labelText: "Type a message:"),
      //changetext call function
      onChanged: (text) => changeText(text) ,
        ),
        //contoller text not updating widget so need to do is figure out way
        Text(this.text)
    ]);
  }
}

