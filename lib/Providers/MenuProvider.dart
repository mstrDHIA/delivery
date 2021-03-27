import 'package:delivery_app_v0/Screens/AdminManage.dart';
import 'package:delivery_app_v0/Screens/Report.dart';
import 'package:flutter/material.dart';
import '../Widgets/popupMenu.dart';
class MenuProvider extends ChangeNotifier {

  Changeoption(BuildContext context,option){
    var result=option;

    notify();
    if(result==MenuOptions.Report){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Report(),));
    }
    if(result==MenuOptions.Settings){
      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminManage(),));
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