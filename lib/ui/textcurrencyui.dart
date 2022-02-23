import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextCurrenctUI extends StatelessWidget{
  String text;
  TextCurrenctUI(String s){
    text = s;
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 5.0,),
    child: Container(
      width: width,
      //color: Colors.green,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      RichText(
        text: TextSpan(
          children: [
            TextSpan(text: text,
              style: TextStyle(fontSize: 26, color: Colors.green,),),
          ],
        ),
      ),
      ],
    ),
    ),
    );
  }
}