import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/MenuProvider.dart';
class Notifications extends StatefulWidget{
  NotificationsPage createState() => NotificationsPage();

}

class NotificationsPage extends State<Notifications>{
  MenuProvider menuProvider;
  @override
  void initState() {
    menuProvider = Provider.of<MenuProvider>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(deviceheight*0.11),
    child: barapp(ti:"Notifications",context:context,menuprovider:menuProvider),
    ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}