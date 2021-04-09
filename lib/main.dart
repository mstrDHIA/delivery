import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API/APIS.dart';
import 'Providers/LoginProvider.dart';
import 'Providers/AppControllerProvider.dart';
import 'Providers/MapProvider.dart';
import 'Providers/MenuProvider.dart';
import 'Providers/OrderProvider.dart';

import 'Providers/RegisterProvider.dart';
import 'Screens/AppController.dart';
import 'Screens/Register.dart';
import 'Screens/api test.dart';

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

        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        


      ],
      child:
         MaterialApp(
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
  bool signed;
  @override
  Future<void> initState()   {
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
          signed=await prefs.then((value) => value.getBool('logged')??false);

          if(!signed){
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(),
              ));
          }
          else{
            Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(),
      ),
      (route) => false,
    );  
          }
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
