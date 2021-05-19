
import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Providers/MapProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Providers/blockedUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'Order.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  OrdersPage createState() => OrdersPage();
}

class OrdersPage extends State<OrdersScreen> {
  int num = 30;
  
  OrderProvider provider;
  blockedUsersProvider blockProvider;

  MapProvider mapProvider;
  LoginProvider loginProvider;


  @override
  void initState() {
    provider = Provider.of<OrderProvider>(context, listen: false);
        loginProvider = Provider.of<LoginProvider>(context, listen: false);

    mapProvider = Provider.of<MapProvider>(context, listen: false);
    blockProvider = Provider.of<blockedUsersProvider>(context, listen: false);
    
    mapProvider.checkGps();
    provider.allorders.clear();

    /*if(provider.list.length==0){
      provider.fetchOrders(context);
    }*/
    
    //provider?.fetchdata(context);
    //print("blablabla");
    //provider?.fetchOrders(context);
    super.initState();
  }
  Geolocator geo=Geolocator();
  User user=User();
  @override
  Future<void> didChangeDependencies() async {
    
  user=await user.decoded();
        provider?.fetchOrders(context,loginProvider,geo,user);

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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
            return RefreshIndicator(
                          onRefresh: () { 
                            provider.list.clear();
                            provider.allorders.clear();
        provider?.fetchOrders(context,loginProvider,geo,user);
                            },
                          child: ListView.builder(
                  itemCount: this.provider.list.length,
                  itemBuilder: (context, int index) => this.provider.list[index]),
            );
        },
      ),
    );

    // return StreamBuilder<http.Response>(
    //   stream: provider.getRandomNumberFact(context,loginProvider),
    //   builder: (context, snapshot) => snapshot.hasData
    //       ? Center(child: Column(children: [
    //         for (var l in provider.list ) l
    //       ],))
    //       : CircularProgressIndicator(),
    // );
   
 }
}