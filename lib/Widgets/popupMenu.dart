import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:flutter/material.dart';

enum MenuOptions{
  Settings,Contact,FeedBack,Logout
}
Menu(BuildContext context,MenuProvider menuprovider){

  return PopupMenuButton<MenuOptions>(
      icon: Icon(Icons.more_vert,color: Colors.white,),
      color: Colors.white,
      onSelected: (MenuOptions option){menuprovider.Changeoption(context,option);},
      itemBuilder: (BuildContext context){


     return <PopupMenuEntry<MenuOptions>>[
      PopupMenuItem(
      child: Text('Settings'),
      value: MenuOptions.Settings,
      ),
    PopupMenuItem(
    child: Text('Contact Us'),
    value: MenuOptions.Contact,
    ),
    PopupMenuItem(
    child: Text('FeedBack'),
    value: MenuOptions.FeedBack,
    ),
    PopupMenuItem(
    child: Text('Logout'),
    value: MenuOptions.Logout,
    )
    ];
  });
}