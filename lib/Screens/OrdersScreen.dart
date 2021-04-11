import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Providers/MapProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:flutter/material.dart';
import 'Order.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  OrdersPage createState() => OrdersPage();
}

class OrdersPage extends State<OrdersScreen> {
  int num = 30;
  
  OrderProvider provider;
  MapProvider mapProvider;


  @override
  void initState() {
    provider = Provider.of<OrderProvider>(context, listen: false);
    mapProvider = Provider.of<MapProvider>(context, listen: false);
    mapProvider.checkGps();
    provider.allorders.clear();
    provider?.fetchOrders(context);

    /*if(provider.list.length==0){
      provider.fetchOrders(context);
    }*/
    
    //provider?.fetchdata(context);
    //print("blablabla");
    //provider?.fetchOrders(context);
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
   
 }
}