
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyratingsUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(24.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[

      Flexible(

      child: RichText(
        text: TextSpan(
         children: [
            TextSpan(text: 'Mid Market Exchange rate at 13:38 UTC ',
      style: TextStyle(fontSize: 16, color: Colors.green,decoration:TextDecoration.underline,),),
           WidgetSpan(
             child: Icon(Icons.report_outlined, size: 20, color: Colors.green,),
           ),
        ],
    ),
        //'Mid Market Exchange rate at 13:38 UTC',
        //style: TextStyle(fontSize: 16, color: Colors.green,decoration:TextDecoration.underline,),),
      ),
      ),
      ],
    ),

    );
  }


}


class LabelUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Flexible(

            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Get rate alerts straight to your Email inbox ',
                    style: TextStyle(fontSize: 16, color: Colors.white38,decoration:TextDecoration.underline,),),
                  // WidgetSpan(
                  //   child: Icon(Icons.report_outlined, size: 20, color: Colors.green,),
                  // ),
                ],
              ),
              //'Mid Market Exchange rate at 13:38 UTC',
              //style: TextStyle(fontSize: 16, color: Colors.green,decoration:TextDecoration.underline,),),
            ),
          ),
        ],
      ),

    );
  }


}