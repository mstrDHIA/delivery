import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'login.dart';



class Map extends StatefulWidget{

  @override
  MapPage createState() => MapPage();
}
int currentindex=0;

class MapPage extends State<Map> {
  static CameraPosition _initialLocation = CameraPosition(
      target: LatLng(0.0, 0.0));

  GoogleMapController mapController;
  final Geolocator _geolocator = Geolocator();
  Position _currentPosition;


  void _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
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
      });
    }).catchError((e) {
      print(e);
    });
  }


  //PageController _pageController = PageController();


  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;


    Widget gmap() {
      return
        Stack(
          children: [
            Center(
              child: GoogleMap(
                // polylines: Set<Polyline>.of(polylines.values),
                initialCameraPosition:
                _initialLocation = CameraPosition(target: LatLng(0.0, 0.0)),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                //markers: markers,
                //onTap: goto,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },

              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipOval(
                        child: Material(
                          color: Colors.redAccent, // button color
                          child: InkWell(
                            splashColor: Colors.blue, // inkwell color
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.zoom_in, color: Colors.white,),
                            ),
                            onTap: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomIn(),
                              );
                              // TODO: Add the operation to be performed
                              // on button tap
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipOval(
                        child: Material(
                          color: Colors.redAccent, // button color
                          child: InkWell(
                            splashColor: Colors.blue, // inkwell color
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.zoom_out, color: Colors.white,),
                            ),
                            onTap: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomOut(),
                              );
                              // TODO: Add the operation to be performed
                              // on button tap
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipOval(
                        child: Material(
                          color: Colors.redAccent, // button color
                          child: InkWell(

                            splashColor: Colors.redAccent, // inkwell color
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                Icons.my_location, color: Colors.white,),
                            ),
                            onTap: () {
                              _getCurrentLocation();
                              // TODO: Add the operation to be performed
                              // on button tap
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
    }

    Widget Orders() {
      return Text('j');
    }

    barapp(String ti) {
      return AppBar(
        title: Text(ti),
      );
    }

    appcontrol(int currentindex) {
      if (currentindex == 0) {
        return barapp("Available Orders");
      }
      else if (currentindex == 1) {
        return null;
      }
      else if (currentindex == 2) {
        return barapp("Profile");
      }
    }

      final tabs = [

        Login(),
        gmap(),
        Center(child: Text("profile")),

      ];


      return Scaffold(
        appBar: appcontrol(currentindex),
        body: Container(
          //height: deviceheight*1,
            transform: Matrix4.translationValues(
                0.0, deviceheight * 0.037, 0.0),

            child: tabs[currentindex]),
        bottomNavigationBar: Container(


          //height: deviceheight*0.08,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    blurRadius: 130,
                    spreadRadius: 1
                )
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
              )
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


                  icon: Icons.person_rounded,
                  title: "Profile",
                ),
              ],
              onTap:
                  (index) {
                setState(() {
                  currentindex = index;
                  print(index);
                });
              } /*(index) {

            _pageController.animateToPage(index,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 600));
          },*/
          ),
        ),
      );
      // TODO: implement build
      throw UnimplementedError();
    }
  }
