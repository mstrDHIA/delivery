import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:flutter/material.dart';
import 'Order.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  @override
  OrdersPage createState() => OrdersPage();
}

class OrdersPage extends State<Orders> {
  int num = 30;
  
  OrderProvider provider;


  @override
  void initState() {
    provider = Provider.of<OrderProvider>(context, listen: false);

    //provider?.fetchdata(context);
    //print("blablabla");
    provider?.fetchOrders(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: Consumer<OrderProvider>(
        builder: (context, provider, child) {
          if (this.provider.loading)
            return Center(child: CircularProgressIndicator());
          else
            return ListView.builder(
                itemCount: this.provider.list.length,
                itemBuilder: (context, int index) => this.provider.list[index]);
        },
      ),
    );
   /* return Consumer<OrderProvider>(
      builder: (context, provider, child) {
        if (this.provider.loading)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
            itemCount: this.provider.list.length,
              itemBuilder: (context, int index) => this.provider.list[index]);
      },
    );*/

   /* return Padding(
      padding: const EdgeInsets.only(top:0.0),
      child: ListView(

        children: [
          SizedBox(height: deviceheight*0.02,),


         listitem(),
         listitem(),
         listitem(),
         listitem(),
         listitem(),
         listitem(),
         listitem(),
         listitem(),
         listitem(),




        ],
      ),
    );*/
    // TODO: implement build
    throw UnimplementedError();
  }

//   listitem() {
//     double deviceheight = MediaQuery.of(context).size.height;
//     double devicewidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 24, right: 24, left: 24),
//       child: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black12,
//                 offset: Offset(0, 1),
//                 blurRadius: 20,
//                 spreadRadius: 1)
//           ],
//           color: Colors.white,
//           borderRadius: BorderRadius.all(
//             Radius.circular(15),
//           ),
//         ),
//         height: deviceheight * 0.125,

//         /* transform: Matrix4.translationValues(


//            devicewidth*0.08, deviceheight * 0.03, 0.0),*/
//         width: devicewidth * 0.85,
//         child: ListTile(
//           onTap: () {
//             //  _increment();
//             showOrder();
//           },
//           leading: Padding(
//             padding: const EdgeInsets.only(top: 6.0, right: 6),
//             child: Image.asset('assets/french-fries.png'),
//           ),
//           title: Padding(
//             padding: const EdgeInsets.only(top: 14.0, left: 16),
//             child: Text(
//               'Order 159',
//               style: TextStyle(
//                   //fontFamily: 'ebrima',
//                   fontSize: 18),
//             ),
//           ),
//           trailing: Text(
//             '$num',
//             style: TextStyle(
//                 //fontFamily: 'ebrima',
//                 fontSize: 18),
//           ),
//           subtitle: Padding(
//             padding: const EdgeInsets.only(top: 8.0, left: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'From ',
//                       style: TextStyle(
//                           fontFamily: 'calist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       'Pizzaria Chipotle',
//                       style: TextStyle(
//                           color: Color(0xffBB2121),
//                           fontFamily: 'calist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: deviceheight * 0.005),
//                 Row(
//                   children: [
//                     Text(
//                       'To ',
//                       style: TextStyle(
//                           fontFamily: 'calist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       'Mohsen Toukebri',
//                       style: TextStyle(
//                           color: Color.fromRGBO(187, 33, 33, 0.86),
//                           fontFamily: 'calist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   showOrder() {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Order(),
//         ));
//   }
 }
