import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'Buyer.dart';
import 'OrderItems.dart';
import 'Payment.dart';
import 'Seller.dart';
import 'User.dart';

class Orders {
  int id;
  String buyerPhone;
  String buyerMail;
  double totalPrice;
  double deliveryFees;
  double price;
  int stars;
  String review;
  String deliveryTime;
  String deliveryDuration;
  String orderTime;
  String orderType;
  bool isPaid;
  double distance;
  double orderDuration;
  String state;
  User user;
  Buyer buyer;
  Payment payement;
  Seller seller;
  List<OrderItems> orderitems;
  

  Orders(
      {this.id,
      this.buyerPhone,
      this.buyerMail,
      this.totalPrice,
      this.deliveryFees,
      this.price,
      this.stars,
      this.review,
      this.deliveryTime,
      this.deliveryDuration,
      this.orderTime,
      this.orderType,
      this.isPaid,
      this.distance,
      this.orderDuration,
      this.state,
      this.user,
      this.buyer,
      this.payement,
      this.seller,
      this.orderitems});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerPhone = json['buyer_phone'];
    buyerMail = json['buyer_mail'];
    totalPrice = json['total_price'];
    deliveryFees = json['delivery_fees'];
    price = json['price'];
    stars = json['stars'];
    review = json['review'];
    deliveryTime = json['delivery_time'];
    deliveryDuration = json['delivery_duration'];
    orderTime = json['order_time'];
    orderType = json['order_type'];
    isPaid = json['is_paid'];
    distance = json['distance'];
    orderDuration = json['order_duration'];
    state = json['state'];
    
  }


  Future<Orders> decoded() async {
     Future<SharedPreferences> prefs = SharedPreferences.getInstance();
        String finalorder=await prefs.then((value) => value.getString('order'));
        List<String> finalorderinfo=finalorder.split('!');            
        Map<String, dynamic> ordermap=jsonDecode(finalorderinfo[0]);
        Orders order=Orders.fromJson(ordermap);
        Map<String, dynamic> buyermap=jsonDecode(finalorderinfo[1]);
        Buyer buyer=Buyer.fromJson(buyermap);
        order.buyer=buyer;
        Map<String, dynamic> sellermap=jsonDecode(finalorderinfo[2]);
        Seller seller=Seller.fromJson(sellermap);
        order.seller=seller;
        Map<String, dynamic> paymentmap=jsonDecode(finalorderinfo[3]);
        Payment payment=Payment.fromJson(paymentmap);
        order.payement=payment;
        //List<String> orderitemslisttxt=finalorderinfo[4].split("}");
        Map<String, dynamic>orderitemsmap;
        List<String>itemslist=List();
        List<OrderItems> orderitems=List();
        
      //  print(finalorderinfo[4]);
        var a=finalorderinfo[4].split("}");
        //print(a[0].split("[")[1]+"}");
        //print("{"+a[1].split("{")[1].split("]")[0]+"}");
        //print(a);
          int l=a.length-1;
print("this is length"+l.toString());
        for(int i=0;i<l;i++){
          if(i==0){
            print("this is 1");
                      itemslist.add(a[i].split("[")[1]+"}");
          }
          else if((i>0)&(i<l)){
                        print("this is 2");

                itemslist.add("{"+a[i].split("{")[1]+"}");
          }
          // else if(i==l){
          //               print("this is 3");

          //           itemslist.add("{"+a[1].split("{")[1].split("]")[0]+"}");

          // }
          orderitemsmap=jsonDecode(itemslist[i]);
          orderitems.add(OrderItems.fromJson(orderitemsmap));
        }

        /*for(int i=0;i<orderitemslisttxt.length;i++){
          int l=orderitemslisttxt.length-1;
          if(i!=l){
            orderitemslisttxt[i]=orderitemslisttxt[i]+"}";
            orderitemsmap.add(jsonDecode(orderitemslisttxt[i]));
            orderitems.add(OrderItems.fromJson(orderitemsmap[i]));
          }
        }*/
        //itemslist=jsonDecode(finalorderinfo[4]);
        
        // for(dynamic item in itemslist){
        //   print(item);
        //   // orderitemsmap=jsonDecode(item);
        //   // orderitems.add(OrderItems.fromJson(orderitemsmap));
        // }
          //orderitems=OrderItems.fromJson(orderitemsmap);
        //OrderItems orderItems=OrderItems.fromJson(orderitemsmap);
        order.orderitems=orderitems;
        // Map<String, dynamic> usermap=jsonDecode(finalorderinfo[5]);
        // User user=User.fromJson(usermap);
        // order.user=user;
         return order;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buyer_phone'] = this.buyerPhone;
    data['buyer_mail'] = this.buyerMail;
    data['total_price'] = this.totalPrice;
    data['delivery_fees'] = this.deliveryFees;
    data['price'] = this.price;
    data['stars'] = this.stars;
    data['review'] = this.review;
    data['delivery_time'] = this.deliveryTime;
    data['delivery_duration'] = this.deliveryDuration;
    data['order_time'] = this.orderTime;
    data['order_type'] = this.orderType;
    data['is_paid'] = this.isPaid;
    data['distance'] = this.distance;
    data['order_duration'] = this.orderDuration;
    data['state'] = this.state;
    
    return data;
  }
}