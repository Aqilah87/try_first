import 'package:flutter/material.dart';
import 'package:try_first/myHomePage.dart';

//buat page navigation
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WELCOME TO MY WORLD HAHA')),
      body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name ='';
  TextEditingController controller = new TextEditingController();

  void click(){
    this.name = controller.text;
    Navigator.push(
      //nak pegi page lain
      context, MaterialPageRoute(
        builder: (context) => MyHomePage(this.name)));

  }


  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center,
    child: Padding(padding: EdgeInsets.all(10),
    child: TextField(
      controller:this.controller,
      //copy dari file textInputWidget
      decoration: InputDecoration(

      //icon is widget 1.
      prefixIcon: Icon(Icons.person), 
      labelText: "Type Your Name:", 
      border: OutlineInputBorder(
        borderSide: BorderSide(width:5, color: Colors.black)),

      //button presses 2.
      suffixIcon: IconButton(
      icon: Icon(Icons.done),
      //jenis-jenis
      splashColor: Colors.blue,
      tooltip: "Submit",
      //empty func
      onPressed: this.click,
      ),
      ),
    )));
  }
}