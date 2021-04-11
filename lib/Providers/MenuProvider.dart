import 'package:delivery_app_v0/Screens/AdminManage.dart';
import 'package:delivery_app_v0/Screens/Report.dart';
import 'package:delivery_app_v0/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/popupMenu.dart';
class MenuProvider extends ChangeNotifier {

  Changeoption(BuildContext context,option) async {
    var result=option;

    notify();
    if(result==MenuOptions.Report){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Report(),));
    }
    if(result==MenuOptions.Settings){
      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminManage(),));
    }
    if(result==MenuOptions.Logout){
       final prefs = await SharedPreferences.getInstance();  
    prefs.setString("logged", "").then((bool success) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),),(route) => false,);
      });
    }

    print(option.toString());
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