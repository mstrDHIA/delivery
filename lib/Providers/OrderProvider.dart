import 'dart:convert';

import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Models/Buyer.dart';
import 'package:delivery_app_v0/Models/OrderItems.dart';
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Models/Payment.dart';
import 'package:delivery_app_v0/Models/Seller.dart';
import 'package:flutter/material.dart';
import '../Widgets/OrdersWidgets.dart';
import 'package:http/http.dart' as http;

class OrderProvider extends ChangeNotifier{


final List<Widget> list=List();
bool loading=false;

/*
Future<void> fetchdata(context)async{
  loading=true;
  notify();
  await Future.delayed(Duration(seconds: 2));
  for(int i=0;i<=10;i++)
  list.add(listitem(context));
  loading=false;
  notify();
}
*/




Future<void> fetchOrders(context) async{
  String OrdersKey=getOrdersApi;
  
  list.clear();
  loading=true;
  //notify();
  List OrderData;

  Orders orders;
  Buyer buyer;
  Seller seller;
  Payment payment;
  List<OrderItems> orderItems=[];
  List<Orders> allorders=[];
  final Orderresponse = await http.get(
    OrdersKey,
  );
  if (Orderresponse.statusCode == 200) {
    OrderData = jsonDecode(Orderresponse.body);
    //print(OrdersKey);
    //print(OrderData[0][0]);

    for(int i=0;i<OrderData.length;i++){
      orders=Orders.fromJson(OrderData[i][0]);
      buyer=Buyer.fromJson(OrderData[i][1]);
      seller=Seller.fromJson(OrderData[i][2]);
      payment=Payment.fromJson(OrderData[i][3]);
      for(int j=0;j<OrderData[i][4].length;j++){
        orderItems.add(OrderItems.fromJson(OrderData[i][4][j]));
      }
      orders.buyer=buyer;
      orders.seller=seller;
      orders.payement=payment;
      orders.orderitems=orderItems;

    allorders.add(orders);
    }
    for(int k=0;k<allorders.length;k++){
      list.add(listitem(context, allorders[k]));
    }





    loading=false;
    notify();
  }
  else{
    print("Order not done");
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