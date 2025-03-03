import 'package:flutter/material.dart';

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
  FocusScope.of(context).unfocus();
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
