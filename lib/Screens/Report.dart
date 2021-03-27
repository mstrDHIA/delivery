import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget{

  @override
  ReportPage createState() => ReportPage();


}

class ReportPage extends State<Report>{
  MenuProvider menuProvider;
  @override
  void initState() {
    menuProvider = Provider.of<MenuProvider>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    TextEditingController control;
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceheight*0.11),
        child: barapp('Report', context, menuProvider),
      ),
      body: Column(
        children: [
          Text('If you have any problems just let us now becouse we care for you'),
          TextField(

            controller: control,
          )
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}