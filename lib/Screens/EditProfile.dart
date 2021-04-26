


import 'package:delivery_app_v0/Models/Profile.dart' as p;
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/ProfileProvider.dart';
import 'package:delivery_app_v0/Screens/ProfileScreen.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:delivery_app_v0/Widgets/LoginWidgets.dart';
import 'package:delivery_app_v0/Widgets/ProfileWidgets.dart';

import 'package:delivery_app_v0/Widgets/popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget{
  final String ti;
  final User user;

  const EditProfile({Key key, this.ti, this.user}) : super(key: key);
  @override
  EditProfilePage createState() => EditProfilePage(ti,user: user);
}

class EditProfilePage extends State<EditProfile> {
  final String ti;
  final User user;
  MenuProvider menuProvider;
  ProfileProvider profileProvider;
    LoginProvider loginProvider;

  TextEditingController firstnamecontrol=TextEditingController();
TextEditingController lastcontrol=TextEditingController();
TextEditingController agecontrol=TextEditingController();
TextEditingController addresscontrol=TextEditingController();
TextEditingController citycontrol=TextEditingController();
TextEditingController phonecontrol=TextEditingController();

  EditProfilePage(this.ti, {this.user});

  @override
  void dispose() {
    profileProvider.vehicleval=null;
    profileProvider.countryval=null;
    profileProvider.stateval=null;
    profileProvider.changed=false;

   // print(profileProvider.vehicleval);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
        menuProvider = Provider.of<MenuProvider>(context, listen: false);
                menuProvider = Provider.of<MenuProvider>(context, listen: false);
        profileProvider = Provider.of<ProfileProvider>(context, listen: false);
            profileProvider.change=false;
          

        profileProvider.selected=null;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(child: barapp(context: context,menuprovider: menuProvider,ti: ti), preferredSize: Size.fromHeight(deviceheight*0.089)),
      body: Consumer<ProfileProvider>(
              builder: (BuildContext context, value, Widget child) {  return SingleChildScrollView(
          child: Column(
            children: [
              editidentifier(context: context,profileProvider: profileProvider,user:user),
              //editform(context: context,profileProvider:profileProvider,addresscontrol: addresscontrol,agecontrol: agecontrol,citycontrol: citycontrol,phonecontrol: phonecontrol,firstnamecontrol: firstnamecontrol,lastnamecontrol: lastcontrol,user: user)
               editform(context: context,profileProvider:profileProvider,addresscontrol: addresscontrol,agecontrol: agecontrol,citycontrol: citycontrol,phonecontrol: phonecontrol,firstnamecontrol: firstnamecontrol,lastnamecontrol: lastcontrol,user: user),
            ],
          ),
        );  },
            
      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,-1),
                    spreadRadius: 1,
                    blurRadius: 20,
                    color: Colors.black12
                ),
              ],
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left:34.0,
                right: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Accept(loginProvider: loginProvider,context: context,address: addresscontrol.text,age: agecontrol.text,profileProvider: profileProvider,city: citycontrol.text,phone: phonecontrol.text,firstname: firstnamecontrol.text,lastname: lastcontrol.text)
              ],
            ),
          ),
        )
    );

    // TODO: implement build
    throw UnimplementedError();
  }
  // barapp(String ti) {
  //   double deviceheight = MediaQuery.of(context).size.height;
  //   double devicewidth = MediaQuery.of(context).size.width;
  //   return Column(
  //     children: [Container(
  //       color: Color.fromRGBO(211, 16, 39, 0.6),
  //       height: deviceheight*0.0365,

  //     ),
  //     Container(
  //         decoration: BoxDecoration(
  //             boxShadow: [
  //               BoxShadow(
  //                   color: Colors.black26,
  //                   offset: Offset(0,3),
  //                   blurRadius: 13,
  //                   spreadRadius: 2
  //               )
  //             ],
  //             gradient: LinearGradient(
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //                 colors:[
  //                   //const Color.fromRGBO(211, 16, 39, 1),
  //                   //const Color.fromRGBO(245, 123, 138, 1),
  //                   Color(0xddD31027),
  //                   Color(0xbaF64B60)

  //                 ]
  //             )
  //         ),
  //         width: devicewidth,
  //         height: deviceheight*0.09,
  //         child:Padding(
  //           padding: const EdgeInsets.only(
  //               right:8,
  //               left: 0
  //           ),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [

  //               Row(
  //                 children: [
  //                   IconButton(
  //                     onPressed:(){
  //                       Navigator.pop(context);
  //                     },
  //                     color: Colors.white,
  //                     icon: Icon(Icons.arrow_back_ios),
  //                   ),
  //                   SizedBox(width: devicewidth*0.00,),
  //                   Text(
  //                     ti,
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 20
  //                     ),

  //                   ),
  //                 ],
  //               ),

  //               Menu(context,menuProvider)
  //             ],
  //           ),
  //         )
  //     ),
  //     ],
  //   );
  // }
  


  // Accept() {

  //   double deviceheight = MediaQuery.of(context).size.height;
  //   double devicewidth = MediaQuery.of(context).size.width;
  //   return Padding(
  //     padding: const EdgeInsets.only(top:12.0,
  //         bottom: 12),
  //     child: FlatButton(
  //       onPressed: (){
  //         print('pressed');
  //       },
  //       child: Container(
  //         decoration: BoxDecoration(
  //             boxShadow: [
  //               BoxShadow(
  //                   offset: Offset(0,3),
  //                   color: Colors.black12,
  //                   blurRadius: 6,
  //                   spreadRadius: 2
  //               )
  //             ],
  //             gradient: LinearGradient(
  //                 begin: Alignment.centerRight,
  //                 end: Alignment.centerLeft,
  //                 colors: [
  //                   Color(0xff71DF79),
  //                   Color(0xff2ACF45),

  //                 ]

  //             ),
  //             // color: Colors.redAccent,
  //             borderRadius: BorderRadius.all(Radius.circular(10))
  //         ),
  //         width: devicewidth*0.4,
  //         height: deviceheight*0.058,
  //         child :Padding(
  //           padding: const EdgeInsets.all(12.0),
  //           child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:[
  //                 Text('Accept',style: TextStyle(color: Colors.white,fontSize: 16),),

  //               ]
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

 
}



