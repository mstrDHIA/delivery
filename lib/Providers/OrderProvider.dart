import 'dart:convert';

import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Models/Buyer.dart';
import 'package:delivery_app_v0/Models/OrderItems.dart';
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Models/Payment.dart';
import 'package:delivery_app_v0/Models/Seller.dart';
import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:delivery_app_v0/Screens/OrdersScreen.dart';
import 'package:delivery_app_v0/Widgets/OrderWidget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../Widgets/OrdersWidgets.dart';
import 'package:http/http.dart' as http;

class OrderProvider extends ChangeNotifier{
  bool taken=false;
Widget which=OrdersScreen();

final List<Widget> list=List();
bool loading=false;
  List<Orders> allorders=[];
  double distance;

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

confirmorder(context){
  taken=false;
          which=OrdersScreen();
          notify();
}

acceptorder(Orders order,context,orderProvider)async{
  order.state="delivering";
Map<String,dynamic> o=order.toJson();
print(o);  

   final Orderresponse = await http.put(
    acceptapi+"${order.id}/",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,dynamic>{
       "id": order.id,
    "buyer_phone": order.buyerPhone,
    "buyer_mail": order.buyerMail,
    "total_price": order.totalPrice,
    "delivery_fees": order.deliveryFees,
    "price": order.price,
    "stars": order.stars,
    "review": order.review,
    "delivery_time": order.deliveryTime,
    "delivery_durations": order.deliveryDuration,
    //"accept_time": order.,
    "order_time": order.orderTime,
    "order_type": order.orderType,
    "is_paid": order.isPaid,
    "distance": order.distance,
    "order_duration": order.orderDuration,
    "state": "pending",
    //"id_user": order.user.id,
    "id_buyer": order.buyer.id,
    "id_payement": order.payement.id,
    "id_seller": order.seller.id
      
    } 
    
  )
  );
  if(Orderresponse.statusCode==200){
      allorders.clear();
      allorders.add(order);
      which=SingleChildScrollView(child: Column(children:[singleorder(order: order,orderProvider: orderProvider,context:context),confirm(context:context,order: order,provider: orderProvider)]));
      taken=true;
      notify(); 
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(order: order,)),
      
      (route) => false,
    );  
    }
}

 CaclulDistance(Orders order,Geolocator geo)async{
   double d;
   double blat = double.parse(order.buyer.lat);
      assert(blat is double);
      double blong = double.parse(order.buyer.long);
      assert(blong is double);
      double slat = double.parse(order.seller.lat);
      assert(slat is double);
      double slong = double.parse(order.seller.long);
      assert(slong is double);
   d =await Geolocator().distanceBetween(slat, slong, blat, blong);
   d=d/1000;
   distance=double.parse(d.toStringAsPrecision(2));
   geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
         .then((Position position) async{
                     d =await Geolocator().distanceBetween(slat, slong, position.latitude, position.longitude);
                  d=d/1000;
   d=double.parse(d.toStringAsPrecision(2));
         });
         print(d);
         distance=distance+d;
            distance=double.parse(distance.toStringAsPrecision(2));

                  //print(distance);

   notify();
   //return distance;
  //print(distance);
  //return distanceInMeters;
}

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
  List<OrderItems> items=[];
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
        items.add(OrderItems.fromJson(OrderData[i][4][j]));
        print(OrderItems.fromJson(OrderData[i][4][j]));
      }
      orders.buyer=buyer;
      orders.seller=seller;
      orders.payement=payment;
      List<OrderItems> orderitems=List.from(items);
      orders.orderitems=orderitems;

    allorders.add(orders);

    print(items.length);
    print("before length"+orders.orderitems.length.toString());

    items.clear();
    print("length"+orders.orderitems.length.toString());
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

  calculsumitem(OrderItems item){
    return item.count*item.price;
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