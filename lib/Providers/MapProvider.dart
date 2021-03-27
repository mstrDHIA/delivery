import 'dart:convert';
import '../Screens/MyMap.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {




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