import 'dart:async';
import 'dart:convert';

import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Models/Buyer.dart';
import 'package:delivery_app_v0/Models/OrderItems.dart';
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Models/Payment.dart';
import 'package:delivery_app_v0/Models/Seller.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:delivery_app_v0/Screens/OrdersScreen.dart';
import 'package:delivery_app_v0/Widgets/OrderWidget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/OrdersWidgets.dart';
import 'package:http/http.dart' as http;

class OrderProvider extends ChangeNotifier{
Widget timerwidget=SizedBox();
  bool scanned=false;
  String scanmsg="";
  String scannedinfo;
  bool taken=false;
  double accepteddistance;
Widget which=OrdersScreen();

final List<Widget> list=List();
bool loading=false;
  List<Orders> allorders=[];
  double distance;
bool scanpage=false;
  Widget scanner=SizedBox(height: 0,width: 0,);

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
int nowtime;
Timer timer;
String now;


blockuser(Orders order,String reason,context) async {
  
 var nowdate = DateTime.now();
  User user=User();
  user=await user.decoded();
var blockresponse=await http.post(block,
body: jsonEncode(<String,dynamic>{
  "id_user":user.id,
  "id_buyer":order.buyer.id,
  "reason":reason,
  "blocker":"user",
  "email":order.buyerMail,
 // "date": nowdate

})

);

if(blockresponse.statusCode==201){
                final pref =  SharedPreferences.getInstance();

              final prefs = await SharedPreferences.getInstance();

            String blocked =await pref.then((value) => value.getString('blocked')??"");

if(blocked==""){
            prefs.setString("blocked", order.buyerMail+"!").then((bool success) async {
              print(blocked);
            });
}
else{
  blocked=blocked+order.buyerMail+"!";
  prefs.setString("blocked", blocked).then((bool success) async {
                  print(blocked);

  });

}

  print("blocked");
                        notify();

  which=OrdersScreen();
                      Navigator.pop(context);
                      notify();
}
else{
  print("not blocked");
 // print();
}
}


starttimer(Orders order){
  nowtime=order.orderDuration.toInt()-1;
  int secs=60;
  Duration duration=Duration(seconds: 1);
   timer=Timer.periodic(
    duration,
    (Timer time){
        if(nowtime>0){
          if(secs>0){
            secs--;   
            notify();        
          }
          if(secs==0){
            nowtime--;
            secs=60;
            notify();
          }
    }
    else if(nowtime==0){
      if(secs>0){
        secs--;
        notify();
      }
      else if(secs==0){
        time.cancel();
        notify();
      }
      
    }
    now=nowtime.toString()+":"+secs.toString();
    print(nowtime.toString()+":"+secs.toString());
    notify();
    }

  );

}


Future<bool> getback(context,order,orderProvider){
  which=which=SingleChildScrollView(child: Column(children:[singleorder(order: order,orderProvider: orderProvider,context:context),
      cam(context: context,provider: orderProvider,order: order),
      confirm(context:context,order: order,provider: orderProvider)]
      ));  
      notify();
      
}

verifOrder({Orders order}){
  //Map<String,dynamic> ordermap=json.decode(scannedinfo);
  String notid=scannedinfo.split(":")[1];
  String id=notid.split("}")[0];
  print(id);
    // print("this is"+ordermap["id"].toString());
    // print("map");
    // print(ordermap);
    //print(scannedinfo);

  if(id==order.id.toString()){
    scanmsg="Correct Order";
    scanned=true;
  }
  else{
    scanmsg="Wrong Order";
    scanned=false;
  }
  
}

confirmorder(context,Orders order) async {
  TextEditingController reasoncontrol=TextEditingController();


   double deviceheight = MediaQuery.of(scaffoldKey.currentContext).size.height;
    double devicewidth = MediaQuery.of(scaffoldKey.currentContext).size.width;
  String url=orderconfirm+order.id.toString()+"/";
            final prefs = await SharedPreferences.getInstance();

  if(scanned){
    print("heni houni");
    scanmsg="";
          scanned=false;

            prefs.setBool("taken", false).then((bool success) async {
              order.state="delivered";
              Map<String,dynamic> o=order.toJson();
              print(o);  
              final confirmresponse=await http.put(url,
            body: jsonEncode(<String,dynamic>{
       "id": order.id,
    "buyer_phone": order.buyerPhone,
    "buyer_mail": order.buyerMail,
    "total_price": order.totalPrice,
    "delivery_fees": order.deliveryFees,
    "price": order.price,
    "stars": order.stars,
    "review": order.review,
    "distance": accepteddistance,

    //"delivery_time": order.deliveryTime.toString(),
    "delivery_durations": order.deliveryDuration,
    "accept_time": order.accept_time.toString(),
    "order_time": order.orderTime,
    "order_type": order.orderType,
    "is_paid": order.isPaid,
    "order_duration": order.orderDuration,
    "state": "pending",
    //"id_user": order.user.id,
    "id_buyer": order.buyer.id,
    "id_payement": order.payement.id,
    "id_seller": order.seller.id
      
    } ));
    if(confirmresponse.statusCode==200){
      timer.cancel();
      print("tawa houni");
        timerwidget=SizedBox();
        showDialog(context: scaffoldKey.currentContext,
          builder: (ctx){
            return AlertDialog(
              content: Container(height: deviceheight*0.125,
              width: devicewidth*0.7,
                child: Column(
                children: [
                  Text("Congratulations the order was successfully confirmed",style: TextStyle(color: Colors.green),),
                  

                  Divider(),
                  Opacity(
                    opacity: 0.6,
                  child: Text("If you had a problem with the buyer you can block him"),
                  )
                ],
            ),
              ),
              actions: [
                // ignore: missing_required_param
                FlatButton(child: Text("Block buyer",style: TextStyle(color: Colors.red),),onPressed: (){
                  Navigator.pop(context);
                  showDialog(context: ctx,
                  builder: (_){return AlertDialog(

                    content: Container(
                      height: deviceheight*0.2,
              width: devicewidth*0.7,
                      child: Column(
                        
                      children: [
                      
                        TextFormField(controller: reasoncontrol,
                          maxLines: null,
                        
                                              cursorColor: Colors.redAccent,

                          decoration: InputDecoration(labelText: "Reason",
                          focusColor: Colors.redAccent,
                          hoverColor: Colors.redAccent,
                          fillColor: Colors.redAccent,
                          labelStyle: TextStyle(color: Colors.redAccent))),
                        SizedBox(height: deviceheight*0.02,),
                        Opacity(opacity: 0.6,
                          child: Text("We are sorry for any trouble you had in your journey, please tell us the reason you're blocking this buyer")),
                      

                      ],
                      
                    ),
                  ),
                  buttonPadding: EdgeInsets.only(
                    left: 32,
                    right: 32
                  ),
                  actions: [
                    FlatButton(onPressed: (){
                      blockuser(order, reasoncontrol.text,context);
                      
                      notify();
                    }, child: Text("Confirm",style: TextStyle(color: Colors.blue),)),
                  FlatButton(onPressed: (){
                      which=OrdersScreen();
                      Navigator.pop(context);
                      notify();
                    }, child: Text("Cancel",style: TextStyle(color: Colors.red)))],
                  );}
                  );
                }),  
               FlatButton(child: Text("Continue delivering",style: TextStyle(color: Colors.blue),),onPressed: (){ which=OrdersScreen();
               Navigator.pop(ctx);
               notify();
               })  
              ],
              // child:Container(
              //   width: devicewidth*0.4,
              //   height: deviceheight*0.2,
              //   child: Text("Do you want to block the user")
              //   )
                );
          }
          
          );

          
                     notify();

    }
    else{
      print("manich houni");
      print(confirmresponse.body);
    }
            });
            
}
else{
  print("wrooooooooooong");
  
}
          
          notify();
}

acceptorder(Orders order,context,orderProvider)async{
        //   final prefs =  SharedPreferences.getInstance();
        //  String usertxt =await prefs.then((value) => value.getString('order')??"");

User user=User();

user=await user.decoded();

  accepteddistance=distance;
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
    //"delivery_time": order.deliveryTime,
    "delivery_durations": order.deliveryDuration,
    //"accept_time": order.,
    "order_time": order.orderTime,
    "order_type": order.orderType,
    "is_paid": order.isPaid,
    "distance": distance,
    "order_duration": order.orderDuration,
    "state": "pending",
    "id_user": user.id,
    "id_buyer": order.buyer.id,
    "id_payement": order.payement.id,
    "id_seller": order.seller.id
      
    } 
    
  )
  );
  if(Orderresponse.statusCode==200){
        if(now==null){
          now=order.orderDuration.toString();
        }
        timerwidget=timewidget(context: context,order: order,orderProvider: orderProvider);
        notify();
        final prefs = await SharedPreferences.getInstance();
        String orderjson=jsonEncode(order);
        String buyerjson=jsonEncode(order.buyer);
        String sellerjson=jsonEncode(order.seller);
        String paymentjson=jsonEncode(order.payement);
        String orderitemsjson=jsonEncode(order.orderitems);
        String userjson=jsonEncode(order.user);
        String finalorder=orderjson+"!"+buyerjson+"!"+sellerjson+"!"+paymentjson+"!"+orderitemsjson+"!"+userjson;
        //String buyerjson=
                  prefs.setString("order", finalorder).then((bool success) {

                  });

      allorders.clear();
      allorders.add(order);
      which=SingleChildScrollView(child: Column(children:[singleorder(order: order,orderProvider: orderProvider,context:context),
      cam(context: context,provider: orderProvider,order: order),
      confirm(context:context,order: order,provider: orderProvider)]
      ));
          prefs.setBool("taken", true).then((bool success) {

      taken=true;
      notify(); 
      starttimer(order);
      Navigator.pop(context);
    //   Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => AppController(order: order,)),
      
    //   (route) => false,
    // );  
   } );}
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
  final pref =  SharedPreferences.getInstance();

            String blocked =await pref.then((value) => value.getString('blocked')??"");
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
    if(!blocked.contains(orders.buyerMail)){
    allorders.add(orders);
    }
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