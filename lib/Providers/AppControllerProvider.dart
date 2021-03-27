import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  void changeContent(int index,int currentindex){
    currentindex = index;
    notify();
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
