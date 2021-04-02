import 'package:flutter/material.dart';


const String initiallink="http://7b9fdb9ed370.ngrok.io/";
const String getOrdersApi=initiallink+"available_orders/";
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