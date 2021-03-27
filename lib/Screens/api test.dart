import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Models/Orders.dart';



class ApiTest extends StatefulWidget{
  ApiTestPage createState() => ApiTestPage();
}

class ApiTestPage extends State<ApiTest>{
 // List<Orders> orderslist=List();

  getdata() async {
    var jsonData;
    Orders orders;
    final response = await http.get(
        "http://bd2c9b50a035.ngrok.io/saye/order/",

    );
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      orders = Orders.fromJson(jsonData[0]);
      print(orders);
      setState(() {});
    }
    else{
      print("not done");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [FloatingActionButton(onPressed: (){
            getdata();
          },child: Icon(Icons.add),)],
        )
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}