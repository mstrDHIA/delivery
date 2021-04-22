import 'dart:convert';

import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedBackProvider extends ChangeNotifier{



  sendFeedBack(context,object,content) async {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    print(object);
    print(content);
    User user=User();
    user=await user.decoded();
   var feedbackResponse=await http.post(feedback,
   body: jsonEncode(<String,dynamic>{
     "id_user":user.id,
     "object":object,
     "message":content
   }));
   if(feedbackResponse.statusCode==201){
     showDialog(context: context,
     builder: (_){
       return Dialog(
         child: Container(height: deviceheight*0.26,
         width: devicewidth*0.6,
           child: Column(
             children: [
               Opacity(opacity: 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("\nYour feedback has been submitted thanks for your support.\n \n Please check your mail from time to time the admin will contact you about your issue",
                 style: TextStyle(
                   //color: Colors.green,
                   fontSize: 16,
                   

                 ),
                 textAlign: TextAlign.center,
                 ),
                            ),
               ),
               SizedBox(height: deviceheight*0.02,)
             ],
           )
           ),
       );
     }
     );
     notify();
   }
   else{
     print("not submitted");
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