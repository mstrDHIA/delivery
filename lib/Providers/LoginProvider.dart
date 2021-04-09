import 'dart:convert';

import 'package:delivery_app_v0/Models/TokenModel.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Screens/AdminManage.dart';
import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:delivery_app_v0/Screens/OrdersScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_v0/API/APIS.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class LoginProvider extends ChangeNotifier {

  String msg="";
  void notify(){
    try{
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }

Future<void> getUser(context,id) async{
    final prefs = await SharedPreferences.getInstance();
    //bool signed=await prefs.then((value) => value.getBool('logged')??false);

    //await prefs.setBool('logged', signed).then((bool success) {};
     
    prefs.setBool("logged", true).then((bool success) {
        print("logged");
      });
      
  String url=getUserApi+"$id/";
  print(url);
 final userresponse=await http.get(getUserApi+"$id/");
  if (userresponse.statusCode == 200) {
      dynamic res=jsonDecode(userresponse.body);
      User user=User.fromJson(res);
      print(user.isSuperuser);
      if(user.isStaff){
        print("admin");
         Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AdminManage(),
      ),
      (route) => false,
    );  
      }
      else{
                print("not admin");

        Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(),
      ),
      (route) => false,
    );  
    }
      }
      notify();
  }





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
    Token token=Token(access: loginresponse.body.split(',')[1].split(":")[1].split('"')[1],refresh: loginresponse.body.split(',')[0].split(":")[1].split('"')[1]);
    //print(token.access);
    Map<String, dynamic> decoded=Jwt.parseJwt(token.access);
    
    print(decoded["user_id"]);
    getUser(context, decoded["user_id"]);
    
    //Token token=Token.fromJson(loginresponse.body);
/*Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(),
      ),
      (route) => false,
    );  }*/
 // else 
  
}
else if(loginresponse.statusCode == 401){
    print("not authorized");
    msg="Unauthorized";
        notify();

  }


  
}
}