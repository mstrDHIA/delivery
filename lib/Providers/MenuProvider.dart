import 'package:delivery_app_v0/Screens/CodeScanner.dart';
import 'package:delivery_app_v0/Screens/Report.dart';
import 'package:delivery_app_v0/Screens/blockedBuyers.dart';
import 'package:delivery_app_v0/Screens/login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/popupMenu.dart';
class MenuProvider extends ChangeNotifier {

  Changeoption(BuildContext context,option) async {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    var result=option;

    notify();
    if(result==MenuOptions.FeedBack){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Report(),));
    }
    if(result==MenuOptions.Settings){
      final pref =  SharedPreferences.getInstance();
                    String blocked =await pref.then((value) => value.getString('blocked'));
      Navigator.push(context, MaterialPageRoute(builder: (context) => blockedUsers(blocked: blocked,),));
     
    }
    if(result==MenuOptions.Logout){
       final prefs = await SharedPreferences.getInstance();  
              final pref =  SharedPreferences.getInstance(); 
              //SharedPreferences mySPrefs = PreferenceManager.getDefaultSharedPreferences(this);


                bool taken=await pref.then((value) => value.getBool('taken'));
                //String blocked=await pref.then((value) => value.getString('blocked'));
                // if(blocked!=null){
                //   //prefs.remove(blocked);
                //   prefs.setString("blocked", null);
                //   print("removed blocked:"+blocked);

                // }

if(!taken){
prefs.setString("logged", "").then((bool success) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),),(route) => false,);
      });
}
else{
  showDialog(context: context,
  builder: (_){return 
  Dialog(
    child: Container(
      height: deviceheight*0.1,
      width: devicewidth*0.3,
      child: Center(child: Text("You can't logout when you accept an order",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: 18
      ),))
      ),
    );}
  );
}
    
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