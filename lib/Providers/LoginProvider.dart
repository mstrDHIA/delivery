import 'dart:convert';

import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:delivery_app_v0/Screens/Orders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_v0/API/APIS.dart';


class LoginProvider extends ChangeNotifier {

Future<void> Login(context,username,password) async{
  final loginresponse = await http.post(
    Authentication,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      "username":username,
      "password":password
    })
  );
  if (loginresponse.statusCode == 200) {
Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(),
      ),
      (route) => false,
    );  }
  else if(loginresponse.statusCode == 401){
    print("not authorized");
  }
}


  void notify(){
    try{
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
}