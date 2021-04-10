import 'dart:convert';

import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:delivery_app_v0/Screens/OrdersScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_v0/API/APIS.dart';


class RegisterProvider extends ChangeNotifier {
  String passwordvalid="";

Future<void> Register(context,username,password,email,phone) async{
  final registerresponse = await http.post(
    Authentication,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      "username":username,
      "password":password,
      "email":email,
      "phone":phone
    })
  );
  if (registerresponse.statusCode == 200) {
Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(),
      ),
      (route) => false,
    );  }
  else if(registerresponse.statusCode == 401){
    print("false information");
  }
  notify();
}

bool passwordvalidaion(String password){
  if(password.length>8){
    passwordvalid="";
    return true;
  }
  else if(password.length==0){
    passwordvalid="this field is required";

    return false;
  }
  else{
    passwordvalid="the password must be at least 8 characters";
    return false;

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