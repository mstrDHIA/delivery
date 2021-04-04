import 'dart:convert';
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Screens/Order.dart';

import '../Screens/MyMap.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {

final List<Marker> markers=List();

  void showClients(List<Orders> orderslist,Orders order,context){
    if(markers.length>0){
          markers.clear();
    }
          double lat = double.parse(order.seller.lat);
      assert(lat is double);
      double long = double.parse(order.seller.long);
      assert(long is double);
      final marker=Marker(
       // onTap: showClients(),
        markerId: MarkerId(order.seller.name),
        position: LatLng(lat,long),
        infoWindow: InfoWindow(
            title: "Order Num ${order.id}",
            snippet: order.seller.name,
          ),
      );
      markers.add(marker);


      for(Orders o in orderslist){
        if(order.seller.id==o.seller.id){
      double lat = double.parse(o.buyer.lat);
      assert(lat is double);
      double long = double.parse(o.buyer.long);
      assert(long is double);
      final marker=Marker(
        //onTap: showClients(),
        markerId: MarkerId(o.buyer.firstName),
        position: LatLng(lat,long),
        infoWindow: InfoWindow(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Order(order: o)));
            },
            title: "Order Num ${o.id}",
            snippet: o.buyer.firstName,
          ),
      );
      markers.add(marker);
      notify();
        }
    }

    print(markers.length);



    
    
    
  }

  List<Marker> AddMarkers(List<Orders> orderslist,context){
    if(markers.length>0){
          markers.clear();
    }
    
    for(Orders order in orderslist){
      double lat = double.parse(order.seller.lat);
      assert(lat is double);
      double long = double.parse(order.seller.long);
      assert(long is double);
      final marker=Marker(
        onTap: (){showClients(orderslist,order,context);},
        markerId: MarkerId(order.seller.name),
        position: LatLng(lat,long),
        infoWindow: InfoWindow(
            title: "Order Num ${order.id}",
            snippet: order.seller.name,
          ),
      );
      markers.add(marker);
    }
    return markers;
  }
  

  void getCurrentLocation(Geolocator _geolocator,Position _currentPosition,GoogleMapController mapController) async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {

        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
        notify();

    }).catchError((e) {
      print(e);
    });
  }


  void notify(){
    try{
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
}