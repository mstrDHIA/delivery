import 'dart:convert';

import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Models/block.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Widgets/blockedBuyersWidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class blockedUsersProvider extends ChangeNotifier {
List blockdata;
 //List<Blocks> blockedBuyers;
List<Widget> blockedwidgets=List();


unblockBuyer(Blocks block,LoginProvider loginProvider,context) async {
  double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
 var blocksdelresponse=await http.delete(blocksdel+block.idUser.toString()+"/"+block.idBuyer.toString()+"/");
  //var unblock =await http.delete(userblocks+user.id.toString()+"/")
  if(blocksdelresponse.statusCode==204){
    for(int i=0;i<loginProvider.blockedBuyers.length;i++){
      if(loginProvider.blockedBuyers[i]==block){
        loginProvider.blockedBuyers.remove(block);
        loginProvider.notify();
        notify();
        break;
      }
    }
    showDialog(context: context,
    builder: (_){
      return Dialog(
        child: Container(
          height: deviceheight*0.125,
          width: devicewidth*0.6,
          child: Text("The buyer was succusfully unblocked"),
        ),
        
      );
    }
    );
  }
}

 getBlockedBuyers(User user) async {
   List<Blocks> blockedBuyers=new List();
   
   Blocks b=Blocks();// User user =User();
// user.decoded();
//print("user id:"+user.id.toString());
   var blockresponse=await http.get(userblocks+user.id.toString()+"/");
   if(blockresponse.statusCode==200){
     int i=0;
     
     blockdata =jsonDecode(blockresponse.body);
    //  print("first info:");
    //  //print(blockdata[0]);
     
    //  print("length:"+blockdata.length.toString());
    //  print("single info"+blockdata[0]["buyerEmail"].toString());
    //  b=Blocks.fromJson(blockdata[0]);
    //  print("block:"+b.buyerEmail.toString());
    //blockedBuyers=List();
     for (var data in blockdata){
      
     //  print("email:"+data["buyerEmail"].toString());
          b=Blocks.fromJson(data);
          blockedBuyers.add(b);
         // print("this is"+b.reason.toString());
          i++;     
     }
     return blockedBuyers;

   }
   else{
     print("block no work");
   }

  //  if(blocked!=""){
  //    blockedBuyers=blocked.split("!");
  //    for(String buyer in blockedBuyers ){
  //      blockedwidgets.add(blockedbuyer(buyer));
  //    }
  //  }
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
