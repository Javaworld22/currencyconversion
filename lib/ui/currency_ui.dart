import 'dart:ui';

import 'package:currencyconversion/ui/textcurrencyui.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoped_model/scoped_model.dart';

import '../model/currency.dart';
import '../statemodel/currencyscope.dart';
import '../helper/toast.dart';

class CurrencyUI extends StatelessWidget{

  String dropdown1Value = 'EUR';
  String dropdown2Value ;
  String dropdown3Value = 'PLN';
  CurrencyScope model1;

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<CurrencyScope>(builder: (context, child, model)
    {
      model1 = model;
      print('first here ${data(model.value2(),model)}');
      print('This is the third ${model.mxn}');
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: ListTile(
                  title: const Text('1'),
                  trailing: Text(
                    model.value1(), style: TextStyle(color: Colors.black26),)
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              color: Colors.black12,
              child: ListTile(
                  title:  Text('${data(model.value2(),model)}'),
                  trailing: Text(
                    model.value2(), style: TextStyle(color: Colors.black26),)
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    //color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.circle, color: colors(model.value1()),),
                        SizedBox(width: 4,),
                        DropdownButton<String>(
                          //icon: Icon(Icons.star),
                          value: model.value1(),
                          onChanged: (String newValue) {
                            //   setState(() {
                                 model.changeValue1(newValue);
                                 model?.mxn = 0.0;
                                 model?.pln =0.0;
                                 model?.eur = 0.0;
                                 model?.aud =0.0;
                                 model?.cad = 0.0;
                                 model?.usd =0.0;
                            //   });
                          },
                          items: <String>[
                            'EUR',
                            'USD',
                            'AUD',
                            'CAD',
                            'PLN',
                            'MXN'
                          ].map<DropdownMenuItem<String>>((String value) {
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
                    child: Icon(
                      Icons.sync_alt_rounded, size: 34, color: Colors.black38,),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.circle, color: colors(model.value2()),),
                      SizedBox(width: 5,),
                      DropdownButton<String>(
                        value: model.value2(),
                        onChanged: (String newValue) {
                          //   setState(() {
                               model.changeValue2(newValue);
                               model?.mxn = 0.0;
                               model?.pln =0.0;
                               model?.eur = 0.0;
                               model?.aud =0.0;
                               model?.cad = 0.0;
                               model?.usd =0.0;
                          //   });
                        },
                        items: <String>[
                          'EUR',
                          'USD',
                          'AUD',
                          'CAD',
                          'PLN',
                          'MXN'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            buildElevatedButton(const StadiumBorder(), context),

          ],
        ),
      );
    });
  }

  Widget buildElevatedButton(OutlinedBorder shape, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final ButtonStyle style = ElevatedButton.styleFrom(shape: shape);
    return ScopedModelDescendant<CurrencyScope>(builder: (context, child, model)
    {
      model1 = model;
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

                icon: !model.update ? Icon(Icons.add, size: 18.0) : CircularProgressIndicatorApp() ,//const Icon(Icons.add, size: 18.0),
                label: const Text(
                    'Convert', semanticsLabel: 'DISABLED BUTTON 2'),
                onPressed: () {
                  model.setData(model.value1());
                },
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    primary: Colors.greenAccent,
                    fixedSize: Size(width, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
        ),

      );
    });
  }

  Color colors(String value){
    if(value == 'EUR')
      return Colors.redAccent;
    else if(value == 'USD')
      return Colors.lightBlueAccent;
    else if(value == 'AUD')
      return Colors.lightGreenAccent;
    else if(value == 'CAD')
      return Colors.yellowAccent;
    else if(value == 'PLN')
      return Colors.grey;
    else
      return Colors.deepPurpleAccent;
  }

  double data(String value, CurrencyScope model){
    print('here 2 is ${value}');
    print('here 3 is ${model?.pln}');
    try {
      if (value == 'EUR')
        return model?.eur;
      else if (value == 'USD')
        return model?.usd;
      else if (value == 'AUD')
        return model?.aud;
      else if (value == 'CAD')
        return model?.cad;
      else if (value == 'PLN')
        return model?.pln;
      else
        return model?.mxn;
    }catch(e){
      print('Exception occured here ${e}');

      return 1.00;
    }
  }

}

class CircularProgressIndicatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.blueGrey,
      strokeWidth: 8,);
  }
}