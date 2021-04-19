import 'dart:convert';

import 'package:delivery_app_v0/Screens/AdminManage.dart';
import 'package:delivery_app_v0/Screens/createProfile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API/APIS.dart';
import 'Models/Orders.dart';
import 'Models/Profile.dart';
import 'Models/User.dart';
import 'Providers/LoginProvider.dart';
import 'Providers/AppControllerProvider.dart';
import 'Providers/MapProvider.dart';
import 'Providers/MenuProvider.dart';
import 'Providers/OrderProvider.dart';

import 'Providers/ProfileProvider.dart';
import 'Providers/RegisterProvider.dart';
import 'Screens/AppController.dart';
import 'Screens/Register.dart';
import 'Screens/api test.dart';
import 'Widgets/OrderWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),

        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        


      ],
      child:
         MaterialApp(
           debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
        ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  String signed;
  OrderProvider orderProvider;
  @override
  Future<void> initState()   {
    orderProvider = Provider.of<OrderProvider>(context, listen: false);


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    String GAK=GoogleApiKey;
    String AO=getOrdersApi;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              GAK,
            ),
             Text(
              AO,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
        
         orderProvider.taken=await prefs.then((value) => value.getBool('taken')??false);
         if(orderProvider.taken){
           Geolocator geo=Geolocator();
         String ordertxt =await prefs.then((value) => value.getString('order')??"");
         Orders order=Orders();
         order=await order.decoded();
         print(order.seller.name);
               orderProvider.allorders.add(order);
                orderProvider.CaclulDistance(order, geo);
            orderProvider.which=SingleChildScrollView(child: Column(children:[singleorder(order: order,orderProvider: orderProvider,context:context),
      cam(context: context,provider: orderProvider,order: order),
      confirm(context:context,order: order,provider: orderProvider)]
      ));  
         }
          signed=await prefs.then((value) => value.getString('logged')??"");
         bool newboy=await prefs.then((value) => value.getBool('new')??false);
          if(newboy){
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => CreateProfile(),
              ),
              (route) => false,
            ); 
          }
          else{
          print(signed);
          if(signed==""){
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(),
              ));
          }
          
          else{
            
            List<String> userinfos=signed.split('!');            
            Map<String, dynamic> usermap=jsonDecode(userinfos[0]);
            User user=User.fromJson(usermap);
            Map<String, dynamic> profilemap=jsonDecode(userinfos[1]);
            Profile profile=Profile.fromJson(profilemap);
            user.profile=profile;
            if(user.isStaff==true){
                  Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AdminManage(),
              ),
              (route) => false,
            ); 
            }
            else{
              usermap.forEach((key, value) {print(key+":"+value.toString());});
              print(user.isStaff);
              print(user.username);
              print(user.profile.age);

                    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(user: user,),
      ),
      (route) => false,
    ); 
            }
       
          }}
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
