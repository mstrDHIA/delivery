import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'API/APIS.dart';
import 'Providers/LoginProvider.dart';
import 'Providers/AppControllerProvider.dart';
import 'Providers/MapProvider.dart';
import 'Providers/MenuProvider.dart';
import 'Providers/OrderProvider.dart';

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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
