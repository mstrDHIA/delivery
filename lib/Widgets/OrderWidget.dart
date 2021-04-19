
import 'package:delivery_app_v0/Models/OrderItems.dart';
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:delivery_app_v0/Screens/CodeScanner.dart';
import 'package:delivery_app_v0/Screens/Notifications.dart';
import 'package:delivery_app_v0/Screens/OrdersScreen.dart';
import 'package:delivery_app_v0/Widgets/OrdersWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'dart:js';

  blank({context}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [

        Container(
          width: devicewidth,
          height: deviceheight*0.32,
          decoration: BoxDecoration(

            image: DecorationImage(
              image: const AssetImage('assets/blank_curve2.png'),
              fit: BoxFit.fill,
            ),

          ),
        ),
        Positioned(
            right: 0,
            top:10,
            child: Image.asset('assets/french-fries.png',)
        ),
      ],
    );
  }


    route({context,Orders order}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,
        right: 20,
        left: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left:16,
                  right: 16

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/sellerpin.png'),
                  Image.asset('assets/Component 1 – 1.png'),
                  Image.asset('assets/buyerpin.png'),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    order.seller.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'arial',
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                    "${order.buyer.firstName} ${order.buyer.lastName}",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'arial',
                      fontWeight: FontWeight.w700
                  ),),

              ],
            ),


          ],
        ),
      ),
    );


  }


    showmap({context}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: FlatButton(
          onPressed: (){
            print('pressed');
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  color: Colors.black26,
                  blurRadius: 6,
                  spreadRadius: 1
                )
              ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffEC5B6C),
                      Color(0xffE33E51),

                ]

                ),
               // color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            width: devicewidth*0.85,
            height: deviceheight*0.08,
            child :Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text(
                      'Show In Map',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          //fontFamily: 'SEGOEUI',
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Image.asset('assets/placeholder (3).png')
                  ]
                ),
              ),
          ),
        ),
      ),
    );
  }


cam({context,OrderProvider provider,order}){
  double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    Color col;
    double h;
    if(provider.scanned){
      col=Colors.green;
      h=deviceheight*0.025;
    }
    else{
      col=Colors.red;
            h=0.0;

    }
  return Column(
    children: [
      provider.scanner,
      
      Container(width: devicewidth*0.2,
      height: deviceheight*0.07,
      
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 40,
          offset: Offset(2,10),
          spreadRadius: 1
        )],
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
        child: IconButton(icon: Icon(Icons.qr_code,size: 30,),
         onPressed: () {
           print("let's scan");
          //  showDialog(context: context,
          //  builder: (_){QRViewExample();}
          //  );
          provider.which=QRViewExample(order: order);
          provider.notify();
           //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QRViewExample()));
           },),
      ),SizedBox(height: h,),
      Text(provider.scanmsg,
      style: TextStyle(
        color: col,
        fontSize: 20
      ),)
      //SizedBox(height: deviceheight*0.05,)
    ],
  );
}


singleorder({Orders order,context,OrderProvider orderProvider}){
  double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
  return Consumer<OrderProvider>(
              builder: (BuildContext context, value, Widget child) {
                  return SingleChildScrollView(
          child: Column(
            children: [
              blank(context: context),



              Container(
                transform: Matrix4.translationValues(


                    0, -deviceheight * 0.08, 0.0),
                child: Column(
                  children: [route(context: context,order: order),
                  showmap(context: context),
                  bill(context: context,order: order,orderProvider: orderProvider),
                  info(context: context,text: "distance:",orderprovider: orderProvider,orders: order),

                  timer(context: context,order: order),

                  ],
                ),
              )


            ],
          ),
        );
                },
              
      );
}


confirm({context,OrderProvider provider,Orders order}) {
     List<Color> colors;

  if(provider.scanned){
      colors=[Color(0xff71DF79),
                    Color(0xff2ACF45)];

  }
  else{
     colors=[Colors.grey,
                    Colors.grey];
  }

    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top:12.0,
      bottom: 12),
      child: FlatButton(
        
        //disabledColor: Colors.grey,
        onPressed: (){
          //provider.acceptorder(order,context,provider);
          provider.confirmorder(context);
          
          print(provider.taken);

          print('pressed');
          //       Navigator.pushAndRemoveUntil(

    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => Notifications()),
      
    //   (route) => false,
    // );  
    //       Navigator.pushAndRemoveUntil(

    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => Notifications()),
      
    //   (route) => false,
    // );  
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 2
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: colors,

              ),
              // color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          width: devicewidth*0.4,
          height: deviceheight*0.058,
          child :Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Confirm',style: TextStyle(color: Colors.white,fontSize: 16),),

                ]
            ),
          ),
        ),
      ),
    );
  }



  Accept({context,OrderProvider provider,Orders order}) {

    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top:12.0,
      bottom: 12),
      child: FlatButton(
        onPressed: (){
          provider.acceptorder(order,context,provider);
          print('pressed');
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 2
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff71DF79),
                    Color(0xff2ACF45),

                  ]

              ),
              // color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          width: devicewidth*0.4,
          height: deviceheight*0.058,
          child :Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Accept',style: TextStyle(color: Colors.white,fontSize: 16),),

                ]
            ),
          ),
        ),
      ),
    );
  }

  

bill({context,Orders order,OrderProvider orderProvider}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    double h=deviceheight*0.05;
    Color color;
    print("this is"+order.orderitems.toString());
    for (OrderItems item in order.orderitems) {
      h=h+deviceheight*0.1;
    }
    String is_paid;
    if(order.isPaid){
        is_paid="Paid";
         color=Colors.green;
    }
    else{
      is_paid="Not Paid";
       color=Colors.red;
    }
    List<Widget> items=billitems(order: order,orderProvider: orderProvider);
    return Padding(
      padding: const EdgeInsets.only(top:24),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 1,
              offset: Offset(0,2)
            ),

          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5)
          ),
          color: Colors.white
        ),
        width: devicewidth*0.86,
        height: h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           // SizedBox(height: deviceheight*0.00001,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                    'Order Content',
                  style: TextStyle(
                      fontSize: 18,
                    fontFamily: 'calist'
                  ),
                )

              ]
            ),
            //billitems(order: order).map((e) => Billitem(item:e)).toList(),
            for(var item in items) item,
            Billitemtxt(orderProvider: orderProvider,txt: "delivery fees",cost: order.deliveryFees),
            Divider(),
            Billitemtxt(orderProvider: orderProvider,txt: "Total",cost: order.totalPrice),

            // Billitem(order: order),
            // Billitem("1 Pizza 4 Cheese Small",9),
            // Billitem("1 Soda 1L",3),
            // Billitem("Delivery fees",3),
            // Divider(),
            // Billitem("Total",30),
            Padding(
              padding: const EdgeInsets.only(right:12.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      is_paid,
                    style: TextStyle(
                      color: color,
                      fontSize: 18,

                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );

  }



Billitemtxt({String txt,OrderProvider orderProvider,double cost}) {
    return Padding(
      padding: const EdgeInsets.only(left:12,right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            txt,
            style: TextStyle(
              fontSize: 17,
                fontFamily: 'calist'

            ),
          ),
         
          Row(
            children: [
              Text(
              cost.toString()+"DT",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'calist',

                fontWeight: FontWeight.bold
            ),
          ),
           
           
            ],
          )
          
        ],
      ),
    );
  }




  billitems({Orders order,OrderProvider orderProvider}){
    List<Widget> list=[];
          print(order.orderitems.length);

    //print(order.orderitems);
    for(int i=0;i<order.orderitems.length;i++){
      print(order.orderitems.length);
      list.add(Billitem(item:order.orderitems[i],orderProvider: orderProvider));
    }
    
    return list;
  }

 Billitem({OrderItems item,OrderProvider orderProvider}) {
    return Padding(
      padding: const EdgeInsets.only(left:12,right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            item.name,
            style: TextStyle(
              fontSize: 17,
                fontFamily: 'calist'

            ),
          ),
         
          Row(
            children: [
              Text(
              "${item.price}",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'calist',

                fontWeight: FontWeight.bold
            ),
          ),
           Text(" x${item.count}= ",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'calist',

                fontWeight: FontWeight.bold
            ),),
           Text("${orderProvider.calculsumitem(item).toString()} DT",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'calist',

                fontWeight: FontWeight.bold
            ),
           )
            ],
          )
          
        ],
      ),
    );
  }


timer({context,Orders order}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        right:42,
        left: 42,
        top:30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Delivery Duration:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          Container(
            height: deviceheight*0.05,
            width: devicewidth*0.17,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(3)
                ),
                border: Border.all(

                  color: Colors.black,
                  width: 3,
                )
            ),
            child: Center(
              child: Container(
                height: deviceheight*0.035,
                width: devicewidth*0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3)
                  ),
                  border: Border.all(

                    color: Colors.black,
                    width: 3,
                  )
                ),
                child:
                Center(
                    child: Text(
                        order.orderDuration.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    )
                )
              ),
            ),
          )
        ],
      ),
    );

  }


   info({context,text,value,OrderProvider orderprovider,Orders orders}) {
   // var v=orderprovider.CaclulDistance(orders);
    //print(orderprovider.distance);
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        right:42,
        left: 42,
        top:30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          Center(
              child: Text(
                  "${orderprovider.distance}Km",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              )
          )
        ],
      ),
    );

  }