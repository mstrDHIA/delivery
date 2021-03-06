
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Providers/AppControllerProvider.dart';
import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Screens/Notifications.dart';
import 'package:delivery_app_v0/Screens/Order.dart';
import 'package:delivery_app_v0/Widgets/OrderWidget.dart';
import 'package:delivery_app_v0/Widgets/popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:provider/provider.dart';
import 'OrdersScreen.dart';
import 'ProfileScreen.dart';

import 'MyMap.dart';

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


class AppController extends StatefulWidget{
final Orders order;
final User user;

  const AppController({Key key, this.order, this.user}) : super(key: key);
  @override
  AppPage createState() => AppPage(order: order,user: user);
}
int currentindex=0;

class AppPage extends State<AppController> {
  
  final Orders order;
  final User user;
  MenuProvider menuprovider;
  AppProvider appProvider;
  OrderProvider provider;
  //Widget which;

  AppPage( {this.user,this.order});

  
  @override
  void initState() {
    provider = Provider.of<OrderProvider>(context, listen: false);

    menuprovider = Provider.of<MenuProvider>(context, listen: false);
    appProvider = Provider.of<AppProvider>(context, listen: false);
    //if(provider.list.length==0){provider?.fetchOrders(context);}
    //provider?.fetchOrders(context);
    // if(provider.taken){
    //   which=singleorder(order: order,context: context,orderProvider: provider);
    // }
    // else{
    //   which=OrdersScreen();
    // }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;






    barapp(String ti) {
      return Column(
        children: [Container(
          color: Color.fromRGBO(211, 16, 39, 0.6),
          height: deviceheight*0.0375,

        ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0,3),
                  blurRadius: 13,
                  spreadRadius: 2
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                  //const Color.fromRGBO(211, 16, 39, 1),
                  //const Color.fromRGBO(245, 123, 138, 1),
                  Color(0xddD31027),
                  Color(0xbaF64B60)

                ]
              )
            ),
            width: devicewidth,
            height: deviceheight*0.09,
            child:Padding(
              padding: const EdgeInsets.only(
                right:8,
                left: 24
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                      ti,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'arial'
                      ),

                  ),

                  Row(
                    children: [
                      IconButton(onPressed:(){
                        //provider.confirmorder(context);
                        provider.shownotif(context: context);
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications(),));
                      },
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 28,),
                      ),
                      Menu(context,menuprovider)

                    ],
                  )
                ],
              ),
            )
          ),
        ],
      );



      /*AppBar(
        actions: [
          Icon(
              Icons.more_vert,
              color: Colors.white,
          ),
          SizedBox(width: devicewidth*0.03,)
        ],
        toolbarHeight: deviceheight*0.08,
        backgroundColor: Colors.redAccent,
        title: Text(ti),
      );*/
    }

    appcontrol(int currentindex) {
      if (currentindex == 0) {
        return PreferredSize(
          preferredSize: Size.fromHeight(deviceheight*0.09),
          child: barapp("Available Orders"),
        );
      }
      else if (currentindex == 1) {
        return PreferredSize(
            child: MyMap(orderslist: provider.allorders,),
            preferredSize: Size.fromHeight(deviceheight*0.871)
        );/*Container(
          color: Color.fromRGBO(211, 16, 39, 0.3),
          height: deviceheight*0.0375,
          //height: 0,

        );*/
        Container(
          height: 0,
          width: 0,
        );
      }
      else if (currentindex == 2) {
        
        return PreferredSize(child: barapp("Profile"), preferredSize: Size.fromHeight(deviceheight*0.09));
      }
    }

    var tabs = [

      Consumer<OrderProvider>(builder: (BuildContext context, value, Widget child) { return Expanded(child: provider.which) ;},),
     
      Container(height: 0,width: 0,),
      Profile(user: user,)
     
    ];
    
    return Scaffold(
key: scaffoldKey,
      appBar: appcontrol(currentindex),
      body: Consumer<OrderProvider>(
              builder: (BuildContext context, value, Widget child) { return Column(
          children: [


            tabs[currentindex],
          ],
        ); },
              
      ),
      bottomNavigationBar: Container(
        


        //height: deviceheight*0.08,
        decoration: BoxDecoration(
          color: Colors.transparent,

            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -2),
                  blurRadius: 50,
                  spreadRadius: 1
              )
            ],

        ),
        child: CustomBottomNavigationBar(

            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black26,
            itemOutlineColor: Colors.redAccent,
            itemBackgroudnColor: Colors.white,
            selectedItemColor: Colors.redAccent,
            
            items: [
              CustomBottomNavigationBarItem(
                titleTextColor: Colors.redAccent,
                icon: Icons.sticky_note_2,
                title: "Orders",
              ),
              CustomBottomNavigationBarItem(
                titleTextColor: Colors.redAccent,
                
                icon: Icons.map,

                title: "Map",
              ),
              CustomBottomNavigationBarItem(
                titleTextColor: Colors.redAccent,


                icon: Icons.person_outline_rounded,

                title: "Profile",
              ),
            ],
            onTap:
                (index) {
              setState(() {
                
                currentindex = index;
                print(index);
              });
            } 
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
