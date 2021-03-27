import 'dart:convert';

import 'package:delivery_app_v0/Models/Orders.dart';
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
  list.clear();
  loading=true;
  notify();
  List OrderData;

  Orders orders;
  final Orderresponse = await http.get(
    "http://ec228fcf670f.ngrok.io/saye/order/",
  );
  if (Orderresponse.statusCode == 200) {
    OrderData = jsonDecode(Orderresponse.body);
    //print(OrderData.length);


    for(int i=0;i<OrderData.length;i++){
      orders = Orders.fromJson(OrderData[i]);
      if(orders.state=="pending"){

        list.add(listitem(context, orders.id));


      }
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