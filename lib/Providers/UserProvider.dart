import 'package:delivery_app_v0/Models/User.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
List<Map<String,dynamic>> userinfo;

fetchUserInfo(User user){

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