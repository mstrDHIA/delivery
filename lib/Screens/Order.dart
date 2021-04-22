import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Providers/blockedUsersProvider.dart';
import 'package:delivery_app_v0/Widgets/OrderWidget.dart';
import 'package:delivery_app_v0/Widgets/popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'OrdersScreen.dart';
import '../Models/Orders.dart';
import 'package:shadow/shadow.dart';



class Order extends  StatefulWidget{
  final Orders order;

  const Order({Key key, this.order}) : super(key: key);


  @override
  OrderPage createState() => OrderPage(order);

}

class OrderPage extends State<Order>{
final Orders order;
MenuProvider menuProvider;
blockedUsersProvider blockProvider;

//Future<double> distance;
OrderPage(this.order);
OrderProvider orderProvider;
LoginProvider loginProvider;

Geolocator geo=Geolocator();
@override
  Future<void> initState()  {
  orderProvider = Provider.of<OrderProvider>(context, listen: false);
  blockProvider = Provider.of<blockedUsersProvider>(context, listen: false);
  loginProvider = Provider.of<LoginProvider>(context, listen: false);

  menuProvider = Provider.of<MenuProvider>(context, listen: false);
  orderProvider.CaclulDistance(order,geo);
  //print(distance);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    barapp(String ti) {
      return Column(
        children: [Container(
          color: Color.fromRGBO(211, 16, 39, 0.6),
          height: deviceheight*0.0375,

        ),
        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,3),
                      blurRadius: 13,
                      spreadRadius: 2
                  )
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:[
                      //const Color.fromRGBO(211, 16, 39, 1),
                      //const Color.fromRGBO(245, 123, 138, 1),
                      Color(0xddD31027),
                      Color(0xbaF64B60)

                    ]
                )
            ),
            width: devicewidth,
            height: deviceheight*0.09,
            child:Padding(
              padding: const EdgeInsets.only(
                  right:8,
                  left: 0
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      IconButton(
                        onPressed:(){
                          Navigator.pop(context);
                          },
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: devicewidth*0.00,),
                      Text(
                        ti,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'arial',
                            fontWeight: FontWeight.w600

                        ),

                      ),
                    ],
                  ),

                  Menu(context,menuProvider)
                ],
              ),
            )
        ),
        ],
      );
    }


    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceheight*0.091),
        child: Column(
          children: [
            barapp("Order Num ${order.id.toString()}"),

          ],
        )
      ),
      backgroundColor: Color(0xfffafafa),
      body: singleorder(order: order,context: context,orderProvider: orderProvider),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0,-1),
              spreadRadius: 1,
              blurRadius: 20,
              color: Colors.black12
            ),
           ],
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left:34.0,
            right: 10
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${order.totalPrice.toString()}DT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
              ),
              Accept(context:context,order: order,provider: orderProvider,blockProvider: blockProvider,loginProvider: loginProvider)
            ],
          ),
        ),
      )
      /*BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Opacity(opacity: 0,child: Icon(Icons.more_vert,)),title: Text('30DT')),
          BottomNavigationBarItem(icon:Opacity(opacity: 0,child: Icon(Icons.more_vert,)),title: FlatButton(onPressed: null, child: Text('30DT'))),

        ],
      ),*/
    );




    // TODO: implement build
    throw UnimplementedError();
  }

  







 
  

}