import 'dart:convert';
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Screens/Order.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:delivery_app_v0/API/APIS.dart';

import '../Screens/MyMap.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {




final List<Marker> markers=List();

    PolylinePoints polylinePoints = PolylinePoints();
    final Map<PolylineId, Polyline> polylines = {};

   void _getPolyline(Position start,Position end) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GoogleApiKey,
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(end.latitude, end.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }


   _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    notify();
  }

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
        onTap: () async {
          
         
          double endlat=double.parse(order.seller.lat);
          double endlong=double.parse(order.seller.long);
          double startlat=double.parse(o.buyer.lat);
          double startlong=double.parse(o.buyer.long);

          Position end=Position(latitude:endlat,longitude: endlong );
          Position start=Position(latitude:startlat,longitude: startlong );

          _getPolyline(start, end);
          
          print(polylines.length);

          
          },
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

  List<Marker> AddMarkers(List<Orders> orderslist,context,Geolocator _geolocator){
    if(markers.length>0){
          markers.clear();
    }
    
    for(Orders order in orderslist){
      double lat = double.parse(order.seller.lat);
      assert(lat is double);
      double long = double.parse(order.seller.long);
      assert(long is double);
      final marker=Marker(
        onTap: () async {
          
          await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
          double endlat=double.parse(order.seller.lat);
          double endlong=double.parse(order.seller.long);

          Position end=Position(latitude:endlat,longitude: endlong );
          _getPolyline(position, end);
          showClients(orderslist,order,context);
                    print(polylines.length);

          });


          
          },
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