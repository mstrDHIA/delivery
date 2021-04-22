
import 'package:delivery_app_v0/Models/block.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Providers/blockedUsersProvider.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:delivery_app_v0/Widgets/OrdersWidgets.dart';
import 'package:delivery_app_v0/Widgets/blockedBuyersWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class blockedUsers extends StatefulWidget{

  final String blocked;

  const blockedUsers({Key key, this.blocked}) : super(key: key);
  @override
  blockedUsersPage createState() => blockedUsersPage(blocked);
  
  }
  
  class blockedUsersPage extends State<blockedUsers>{
  final String blocked;

  blockedUsersPage(this.blocked);

blockedUsersProvider blockedProvider;
MenuProvider menuProvider;
OrderProvider orderProvider;
LoginProvider loginProvider;

List<Widget>blockedWidgets=List();


    @override
  void initState() {
                    
        blockedProvider = Provider.of<blockedUsersProvider>(context, listen: false);
                menuProvider = Provider.of<MenuProvider>(context, listen: false);
                                loginProvider = Provider.of<LoginProvider>(context, listen: false);

                        orderProvider = Provider.of<OrderProvider>(context, listen: false);
                        for(Blocks b in loginProvider.blockedBuyers){
                          blockedWidgets.add(blockedbuyer(b ,blockedProvider,loginProvider,context));
                        }
// print(loginProvider.blockedBuyers.length);
// print(loginProvider.blockedBuyers[0].reason);

//                 if(orderProvider.blockedBuyers!=null){
//                   orderProvider.blockedBuyers.clear();
// blockedProvider.blockedwidgets.clear();
//                 }


       // blockedProvider.getBlockedBuyers(blocked);


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(deviceheight*0.09),
          child:barapp(context: context,ti: "Blocked Buyers",menuprovider: menuProvider),),
        body:Consumer<LoginProvider>(
                  builder: (BuildContext context, value, Widget child) { 
  return Column(
            children: [
              for (var buyer in blockedWidgets) buyer,
            ],
          );
                   },
                
        )
      );
    // TODO: implement build
    throw UnimplementedError();
  }


}