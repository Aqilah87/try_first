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
    return Scaffold(appBar: AppBar(title: Text('Hello World')),
    body: Row(
      children: <Widget>[TestWidget(), TestWidget(), TestWidget()],
    ));
  }
}

// page lain
class TestWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text('Hiiiii');
  }
}