
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Screens/Order.dart';
import 'package:flutter/material.dart';

showOrder({context,Orders order}) {
  // for(int i=0;i<order.orderitems.length;i++){
  //   print(order.orderitems[i].name);
  // }
  //print(order.orderitems);
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Order(order:order),
      ));
}


Widget listitem(context,Orders order) {
  //print("I am listing");
  
  //print(order.price);
  // for(int i=0;i<order.orderitems.length;i++){
  //   print(order.orderitems[i].name);
  // }
  //String buyername=order.buyer.firstName+" "+order.buyer.lastName;
 // String sellername=order.seller.firstName+" "+order.seller.lastName;

  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 24, right: 24, left: 24),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 20,
              spreadRadius: 1)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: deviceheight * 0.125,


      width: devicewidth * 0.85,
      child: ListTile(
        onTap: () {
          
          //  _increment();
          showOrder(context:context,order:order);
        },
        leading: Padding(
          padding: const EdgeInsets.only(top: 6.0, right: 6),
          child: Image.asset('assets/french-fries.png'),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 16),
          child: Text(
            "Order Num "+order.id.toString(),
            style: TextStyle(
              //fontFamily: 'ebrima',
                fontSize: 18),
          ),
        ),
        trailing: Text(
          order.totalPrice.toString()+"DT",
          style: TextStyle(
            //fontFamily: 'ebrima',
              fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'From ',
                    style: TextStyle(
                        fontFamily: 'calist',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                                      child: Text(
                      "${order.seller.name}",
                      style: TextStyle(
                          color: Color.fromRGBO(187, 33, 33, 0.86),
                          fontFamily: 'calist',
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                ],
              ),
              SizedBox(height: deviceheight * 0.005),
              Row(
                children: [
                  Text(
                    'To ',
                    style: TextStyle(
                        fontFamily: 'calist',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${order.buyer.firstName} ${order.buyer.lastName}",
                    style: TextStyle(
                        color: Color.fromRGBO(187, 33, 33, 0.86),
                        fontFamily: 'calist',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}



