import 'package:flutter/material.dart';


const String initiallink="http://0dd520630af9.ngrok.io/";
const String getOrdersApi=initiallink+"available_orders/";
const String getUserApi=initiallink+"user/";
const String adminmanage=initiallink+"admin/";
const String GoogleApiKey="AIzaSyD6ijb43zMaxEZCfGP_XF7Cc4NgIByAGS0";
const Authentication=initiallink+"api/token/";





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