import 'dart:ui';

import 'package:currencyconversion/ui/textcurrencyui.dart';
import 'package:flutter/material.dart';

class CurrencyUI extends StatelessWidget{

  String dropdown1Value = 'EUR';
  String dropdown2Value ;
  String dropdown3Value = 'PLN';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black12,
          child: ListTile(
            title: const Text('1'),
            trailing: Text('EUR')
          ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Container(
            color: Colors.black12,
          child: ListTile(
            title: const Text('3455.9766'),
            trailing: Text('PDT')
          ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Container(
            color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.star),
                 DropdownButton<String>(
                  //icon: Icon(Icons.star),
                  value: dropdown1Value,
                  onChanged: (String newValue) {
                    //   setState(() {
                    //     dropdown1Value = newValue;
                    //   });
                  },
                  items: <String>['EUR'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ],
                ),
              ),
                Container(
                  child: Icon(Icons.sync_alt_rounded, size: 34, color: Colors.black38,),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     Icon(Icons.star),
            //   DropdownButton<String>(
            //     value: dropdown1Value,
            //     onChanged: (String newValue) {
            //       //   setState(() {
            //       //     dropdown1Value = newValue;
            //       //   });
            //     },
            //     items: <String>['One', 'Two', 'Four','EUR'].map<DropdownMenuItem<String>>((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //   ),
            //   ],
            // ),
                ),
              DropdownButton<String>(
                value: dropdown3Value,
                onChanged: (String newValue) {
                  //   setState(() {
                  //     dropdown1Value = newValue;
                  //   });
                },
                items: <String>['One', 'Two', 'EUR', 'PLN'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

    ],
          ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          buildElevatedButton(const StadiumBorder(),context),

        ],
      ),
    );
  }

  Widget buildElevatedButton(OutlinedBorder shape, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final ButtonStyle style = ElevatedButton.styleFrom(shape: shape);
    return Align(
      widthFactor: 3.0,
      alignment: const Alignment(0.0, -0.2),
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
          //const SizedBox(height: 2),
          // OverflowBar(
          //   spacing: 8,
          //   children: <Widget>[
          //     ElevatedButton(
          //       style: style,
          //       child: const Text('ELEVATED BUTTON', semanticsLabel: 'ELEVATED BUTTON 1'),
          //       onPressed: () {
          //         // Perform some action
          //       },
          //     ),
          //      ElevatedButton(
          //       child: Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 1'),
          //       onPressed: () {
          //         // Perform some action
          //       },
          //     ),
          //   ],
          // ),
          //const SizedBox(height: 16),
      child: Container(
        width: width,
        //color: Colors.green,
          child: OverflowBar(
            spacing: 8,
            children: <Widget>[
              // ElevatedButton.icon(
              //   style: style,
              //   icon: const Icon(Icons.add, size: 18.0),
              //   label: const Text('ELEVATED BUTTON', semanticsLabel: 'ELEVATED BUTTON 2'),
              //   onPressed: () {
              //     // Perform some action
              //   },
              // ),
              ElevatedButton.icon(
                //style: style,
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('Convert', semanticsLabel: 'DISABLED BUTTON 2'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize:20 ),
                    primary: Colors.greenAccent,
                    fixedSize:  Size(width, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
      ),

    );
  }

}