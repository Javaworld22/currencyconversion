import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast{

  void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        //toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white
    );
  }
}