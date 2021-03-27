import 'package:flutter/material.dart';

class APIS extends InheritedWidget{
  final String GoogleApiKey;
  final getOrdersApi;

  APIS({
    this.getOrdersApi,
    this.GoogleApiKey = "AIzaSyD6ijb43zMaxEZCfGP_XF7Cc4NgIByAGS0",

    Key key,
    Widget child}
    ):super(
      key: key,
      child: child
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

}