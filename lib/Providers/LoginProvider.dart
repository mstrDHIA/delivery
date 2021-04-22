import 'dart:convert';

import 'package:delivery_app_v0/Models/Profile.dart';
import 'package:delivery_app_v0/Models/TokenModel.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Models/block.dart';
import 'package:delivery_app_v0/Providers/blockedUsersProvider.dart';
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
  String activeuser;
  String uservalid="";
  String passwordvalid="";
  Widget logverpass;
  Widget logveruse;
  String msg="";
  void notify(){
    try{
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }

 


 passwordvalidation(String password){
   
  if(password==""){
  

     passwordvalid="this field is required";
  }
  else {
   

    passwordvalid= "";
  }
  notify();
}

  String uservalidation(String user){
  if(user==""){
  

    uservalid= "this field is required";
  }
  else {

    uservalid= "";
    
  }
  notify();
}


List<Blocks> blockedBuyers=List<Blocks>();


Future<void> getUser(context,id,blockedUsersProvider blockProvider) async{
    final prefs = await SharedPreferences.getInstance();
    //bool signed=await prefs.then((value) => value.getBool('logged')??false);

    //await prefs.setBool('logged', signed).then((bool success) {};
     
    
      
  String url=getUserApi+"$id/";
  //print(url);
 final userresponse=await http.get(getUserApi+"$id/");
  if (userresponse.statusCode == 200) {
      dynamic res=jsonDecode(userresponse.body);
      //print(res[0][0]);
      User user=User.fromJson(res[0][0]);
      Profile profile = Profile.fromJson(res[1]);
      user.profile=profile;
      activeuser=jsonEncode(user);
      String activeprofile=jsonEncode(user.profile);
      String activeuserprofile=activeuser+"!"+activeprofile;
      print(activeuser+"!"+activeprofile);


      //print(user.isSuperuser);
       prefs.setString("logged", activeuserprofile).then((bool success) {
         
      //  print("logged");
      });
      if(user.isStaff){
      //   prefs.setString("logged", "Admin").then((bool success) {
      //   print("logged");
      // });
      // String userjson=
      // prefs.setString("logged", "Admin").then((bool success) {
      //   print("logged");
      // });
        print(user.profile.age);

        //print("admin");
         Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AdminManage(),
      ),
      (route) => false,
    );  
      }
      else{
      //    prefs.setString("logged", "User").then((bool success) {
      //   print("logged");
      // });
      //prefs.
               // print("not admin");
              // blockProvider.notify();
                      blockedBuyers=await  blockProvider.getBlockedBuyers(user);

        Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(user: user),
      ),
      (route) => false,
    );  
    }
      }
      notify();
  }





Future<void> Login(context,username,password,blockedUsersProvider blockedProvider) async{

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
    getUser(context, decoded["user_id"],blockedProvider);
    
    
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
    msg="User Name or Password wrong \n please verify your information";
        notify();

  }


  
}
}