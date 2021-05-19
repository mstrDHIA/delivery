
import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/ProfileProvider.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveredOrders extends StatefulWidget{

  @override
  DeliveredOrdersPage createState() => DeliveredOrdersPage();
  
}



class DeliveredOrdersPage extends State<DeliveredOrders>{
  
ProfileProvider profileProvider;
MenuProvider menuProvider;
  @override
  void initState() {
 profileProvider = Provider.of<ProfileProvider>(context, listen: false);
        menuProvider = Provider.of<MenuProvider>(context, listen: false);
profileProvider.getDeliveredOrders(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(deviceheight*0.089),
        child:barapp(ti:"Delivered Orders",context: context,menuprovider: menuProvider)),
      body: Consumer<ProfileProvider>(builder: (BuildContext context, value, Widget child) { 
        return ListView.builder(
                itemCount: this.profileProvider.alldeliveredwidgets.length,
                itemBuilder: (context, int index) => this.profileProvider.alldeliveredwidgets[index]);
       },),
    );
    // TODO: implement build
    throw UnimplementedError();
  }



}