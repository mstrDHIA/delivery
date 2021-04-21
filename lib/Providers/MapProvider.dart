import 'dart:convert';
import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Screens/Order.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:delivery_app_v0/API/APIS.dart';
import 'package:location/location.dart' as loc;

import '../Screens/MyMap.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {


BitmapDescriptor customIcon1;
BitmapDescriptor customIcon2;

Widget timerwidget;
bool chosen=false;
final List<Marker> buyermarkers=List();

final List<Marker> markers=List();

    PolylinePoints polylinePoints = PolylinePoints();
    final Map<PolylineId, Polyline> polylines = {};
    final List<Map<PolylineId, Polyline>> polylist=List();


  var location = loc.Location();


Future checkGps() async {
if(!await location.serviceEnabled()){
   location.requestService();
  }
}

   void _getPolyline(Position start,Position end,String name) async {
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
    _addPolyLine(polylineCoordinates,name);
  }


   _addPolyLine(List<LatLng> polylineCoordinates,String name) {
    PolylineId id = PolylineId(name);
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    polylist.add(polylines);
    notify();
  }

 


  void AddMarkers(List<Orders> orderslist,context,Geolocator _geolocator){
  

    if(markers.length>0){
      markers.clear();
    }
    for(Orders order in orderslist){
      double lat = double.parse(order.seller.lat);
       assert(lat is double);
       double long = double.parse(order.seller.long);
       assert(long is double);
       Marker marker=Marker(
         icon: customIcon1,
          position: LatLng(lat,long),
         markerId: MarkerId("seller,${order.seller.name}"),
         
         onTap: ()  async{
            selleraction(order,orderslist,context,_geolocator);

           
           await _geolocator
         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
         .then((Position position) async{

                  Position end=Position(latitude: lat,longitude: long);
                  _getPolyline(position, end, "route seller");
         print("3lh");
         notify();

         });
         notify();
         },
         infoWindow: InfoWindow(
            title: order.seller.name
         ),
       );
       markers.add(marker);
    }
           notify();

  }



   Future<void> selleraction(Orders order,List<Orders> orderslist,context,Geolocator _geolocator) async {
     if(polylines.length>1){
       print(polylines.length);
       print("polypoly");
       polylines.remove(polylines[1]);
              print(polylines.length);

       notify();
     }
    int i=0;
    while(i<markers.length){
      print(markers[i].markerId);

      if(markers[i].markerId!=MarkerId("seller,${order.seller.name}")){

        markers.remove(markers[i]);
      }
      else{
        i++;
      }
    }
    double lat = double.parse(order.seller.lat);
       assert(lat is double);
       double long = double.parse(order.seller.long);
       assert(long is double);
       
        

       for(Orders o in orderslist){
         if(order.seller.id==o.seller.id){          
            double lat = double.parse(o.buyer.lat);
            assert(lat is double);
            double long = double.parse(o.buyer.long);
            assert(long is double);
            Marker marker=Marker(
              icon: customIcon2,

              position: LatLng(lat,long),
              markerId: MarkerId("buyer,${o.buyer.firstName}"),
              infoWindow: InfoWindow(
                title: "buyer ${o.buyer.firstName}",
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Order(order: o)));}
              ),
              onTap: (){

                buyeraction(o);
                notify();
              }
            );
            buyermarkers.add(marker);
            markers.add(marker);
         }
       }
       
    notify();
  }

  void buyeraction(Orders order){
    double lats = double.parse(order.seller.lat);
      assert(lats is double);
      double longs = double.parse(order.seller.long);
      assert(longs is double);
double late = double.parse(order.buyer.lat);
      assert(late is double);
      double longe = double.parse(order.buyer.long);
      assert(longe is double);
    Position start=Position(latitude: lats,longitude: longs);
        Position end=Position(latitude: late,longitude: longe);
  print(polylines.length);
    _getPolyline(start, end, "route buyer");
  print(polylines.length);

    notify();
    int i=0;
    while(i<markers.length){
      print("dddd");
        if((markers[i].markerId!= MarkerId("buyer,${order.buyer.firstName}"))&(markers[i].markerId != MarkerId("seller,${order.seller.name}"))){
          
              print(markers[i].markerId);
              print("same");
                markers.remove(markers[i]);
            

        }
        else{
                        print("not same");

          i++;
        }
        notify();
    }
}

  void getCurrentLocation(Geolocator _geolocator,Position _currentPosition,GoogleMapController mapController) async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {

        // Store the position in the variable
        _currentPosition = position;

        //print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14.0,
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