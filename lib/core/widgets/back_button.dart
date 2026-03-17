import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context,{Color? color}){
  void handle (){
    Navigator.pop(context ,false);
  }
  return IconButton(
    style: IconButton.styleFrom(
      padding: EdgeInsets.all(10)
    ),
      onPressed: handle, icon: Icon(Icons.arrow_back_ios),color: color,);
}