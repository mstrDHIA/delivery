import 'package:flutter/material.dart';


const String initiallink="http://0b0c2fb7ce9b.ngrok.io";
const String getOrdersApi=initiallink+"/available_orders/";
const String getUserApi=initiallink+"/user_info/";
const String edituser=initiallink+"/user/";
const String adminmanage=initiallink+"/admin/";
const String GoogleApiKey="AIzaSyD6ijb43zMaxEZCfGP_XF7Cc4NgIByAGS0";
const Authentication=initiallink+"/api/token/";
const acceptapi=initiallink+"/accept_order/";
const createuser=initiallink+"/new_user/";
const profile=initiallink+"/profile/";





// class APIS extends InheritedWidget{
//   final String GoogleApiKey;
//   final getOrdersApi;
//   final Authentication;

//   APIS({
//     this.Authentication=initiallink+"api/token/",
//     this.getOrdersApi=initiallink+"available_orders/",
//     this.GoogleApiKey = "AIzaSyD6ijb43zMaxEZCfGP_XF7Cc4NgIByAGS0",
    
//     Key key,
//     Widget child}
//     ):super(
//       key: key,
//       child: child
//   );

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     // TODO: implement updateShouldNotify
//     throw UnimplementedError();
//   }

// }