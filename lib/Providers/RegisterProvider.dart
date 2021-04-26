import 'dart:convert';

import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:delivery_app_v0/Screens/EditProfile.dart';
import 'package:delivery_app_v0/Screens/EditProfile.dart';
import 'package:delivery_app_v0/Screens/OrdersScreen.dart';
import 'package:delivery_app_v0/Screens/createProfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_v0/API/APIS.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterProvider extends ChangeNotifier {
  String passwordvalid="";
  String emailvalid="";
  String uservalid="";
  String confirmvalid="";

  Widget regwidpass=SizedBox(height: 0,);
  Widget regwidemail=SizedBox(height: 0,);
  Widget regwiduse=SizedBox(height: 0,);
  Widget regwidcon=SizedBox(height: 0,);


confirmpasswordvalidation(String password,String confirm){
  confirmvalid="";
  bool ok=true;
   if(confirm==""){
    ok=false;
    confirmvalid="This field is required\n";
  }
  else if(confirm!=password){
    confirmvalid="Passwords don't match";
    ok=false;
  }
  return ok;
}


registeruservalidation(String username){
  uservalid="";
  bool ok=true;
   if(username==""){
    ok=false;
    uservalid="This field is required\n";
  }
  return ok;
}


registeremailvalidation(String email){
  emailvalid="";
  bool ok=true;
   if(email==""){
    ok=false;
    emailvalid="This field is required\n";
  }
  
   notify();
   print(passwordvalid);
   return ok;
}

registerpasswordvalidation(String password){
  passwordvalid="";
  bool ok=true;
   if(password==""){
     ok=false;

     passwordvalid="This field is required\n\n";
  }
  else {
   

    passwordvalid= "";
  }
   if((password.contains(new RegExp(r'[A-Z]')))||(password.contains(new RegExp(r'[a-z]')))){

     passwordvalid+="";
   }
   else{
               ok=false;

     passwordvalid+="Password can't be entirely numeric\n\n";

   }
   if(password.length<8){
          ok=false;

     passwordvalid+="Password length should be > 8";

   }
   else{
      passwordvalid+="";

   }
   notify();
   print(passwordvalid);
   return ok;
 }


Future<void> Register(context,username,password,email,LoginProvider loginProvider) async{
  // LoginProvider loginProvider;
  // loginProvider = Provider.of<LoginProvider>(context, listen: false);

  final registerresponse = await http.post(
    createuser,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      "username":username,
      "password":password,
      "email":email,
     
    })
  );
  if (registerresponse.statusCode == 201) {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("new", true).then((bool success) {
      
      int id=int.parse(registerresponse.body.split(':')[1].split(',')[0]);
      User user=User(email: email,username: username,id: id,password: password);
      String usertxt=jsonEncode(user);
       print("baba ali azouz");
           prefs.setString("logged", usertxt).then((bool success) {
               Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => CreateProfile(),
      ),
      (route) => false,
    );
           }

   // loginProvider.Edit();
// Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => CreateProfile(),
//       ),
//       (route) => false,
//     );
      //  print("logged");
    );});
     }
  
  else if(registerresponse.statusCode == 400){
    print("hahaha");
    //print(registerresponse.body);
    List<String> error=registerresponse.body.split("[");
    //print(error[0]);
    if(error[0]=='{"username": '){
      uservalid="A user with that username already exists.";
      notify();
      print(uservalid);
    }
    if(error[0]=='{"email": '){
      emailvalid="Please enter a valid email format";
      print(error[0]);
      notify();
      //print(uservalid);
    }
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