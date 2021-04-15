//import 'dart:js';

import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Widgets/ProfileWidgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'Edit.dart';
class Profile extends StatefulWidget{
    final User user;

  const Profile({Key key, this.user}) : super(key: key);

  @override
  ProfilePage createState() => ProfilePage(user: user);
}

class ProfilePage extends State<Profile> {
  @override
  final User user;
  

  ProfilePage({this.user});
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;




    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            identifier(context: context,user: user),
            MonthStats(context: context,user: user),
            info(context: context,user: user),
          ],
        ),
      ),
    );


    // TODO: implement build
    throw UnimplementedError();
  }






  }
