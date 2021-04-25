import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Providers/ProfileProvider.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:delivery_app_v0/Widgets/DeliveredWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Delivered extends StatefulWidget{
final Orders order;

  const Delivered({Key key, this.order}) : super(key: key);
  @override
  DeliveredPage createState() => DeliveredPage(order);
  
}



class DeliveredPage extends State<Delivered>{
  final Orders order;
  
ProfileProvider profileProvider;
OrderProvider orderProvider;

MenuProvider menuProvider;

  DeliveredPage(this.order);
  @override
  void initState() {
 profileProvider = Provider.of<ProfileProvider>(context, listen: false);
        menuProvider = Provider.of<MenuProvider>(context, listen: false);
        orderProvider = Provider.of<OrderProvider>(context, listen: false);

profileProvider.getDeliveredOrders(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(deviceheight*0.09),
      child: barapp(menuprovider: menuProvider,context: context,ti:"Delivered Order Num "+order.id.toString()),),
      body: singleorder(order: order,context: context,orderProvider: orderProvider),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0,-1),
      //         spreadRadius: 1,
      //         blurRadius: 20,
      //         color: Colors.black12
      //       ),
      //      ],
      //     color: Colors.white
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.only(
      //       left:34.0,
      //       right: 10
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Text("${order.totalPrice.toString()}DT",
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.w500
      //         ),
      //         ),
      //         Accept(context:context,order: order,,blockProvider: blockProvider,loginProvider: loginProvider)
      //       ],
      //     ),
      //   ),
      // ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}