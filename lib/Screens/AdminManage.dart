import 'dart:io';

import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../API/APIS.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdminManage extends StatefulWidget{
  @override
  AdminManagePage createState() => AdminManagePage();
  
}

class AdminManagePage extends State<AdminManage>{
  MenuProvider menuProvider;
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    menuProvider = Provider.of<MenuProvider>(context, listen: false);

    super.initState();
    // Enable hybrid composition.
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceheight*0.088899),
        child: barapp(ti:'Admin Manage',context:context,menuprovider:menuProvider),
      ),
      body: WebView(
        initialUrl: adminmanage,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}