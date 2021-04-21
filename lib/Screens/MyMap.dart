import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Widgets/OrderWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/MapProvider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class MyMap extends StatefulWidget{
  final List<Orders> orderslist;


  const MyMap({Key key, this.orderslist}) : super(key: key);

  @override
  MapPage createState() => MapPage(orderslist);
}
int currentindex=0;

class MapPage extends State<MyMap> {
  final List<Orders> orderslist;
  



  GoogleMapController mapController;
  final Geolocator _geolocator = Geolocator();
  Position _currentPosition;





  //PageController _pageController = PageController();
  MapProvider mapProvider;
  OrderProvider orderProvider;

  MapPage(this.orderslist);

      //List<Marker> markers;

      @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
         // orderProvider.timewidget=timewidget(context: context,order: orderslist[0]);

    super.didChangeDependencies();
  }
  @override
  void initState() {

    mapProvider = Provider.of<MapProvider>(context, listen: false);
    orderProvider = Provider.of<OrderProvider>(context, listen: false);

    mapProvider.getCurrentLocation(_geolocator,_currentPosition,mapController);
      mapProvider.checkGps();

BitmapDescriptor.fromAssetImage(
         ImageConfiguration(devicePixelRatio: 2.5),
         'assets/sellerpin.png').then((onValue) {
            mapProvider.customIcon1 = onValue;
         });
         BitmapDescriptor.fromAssetImage(
         ImageConfiguration(devicePixelRatio: 2.5),
         'assets/buyerpin.png').then((onValue) {
            mapProvider.customIcon2 = onValue;
         });
  // }

//       if (mapProvider.customIcon1 == null) {
//     ImageConfiguration configuration = createLocalImageConfiguration(context);
//     BitmapDescriptor.fromAssetImage(configuration, 'assets/sellerpin.png')
//         .then((icon) {
//         mapProvider.customIcon1 = icon;
//         mapProvider.notify();
//     });
//   }
//  if (mapProvider.customIcon2 == null) {
//     ImageConfiguration configuration = createLocalImageConfiguration(context);
//     BitmapDescriptor.fromAssetImage(configuration, 'assets/buyerpin.png')
//         .then((icon) {
//         mapProvider.customIcon1 = icon;
//         mapProvider.notify();
//     });
 // }
    // mapProvider.AddMarkers(orderslist,context,_geolocator);
    mapProvider.chosen=false;
   
    mapProvider.polylines.clear();
    super.initState();


  }
  static CameraPosition _initialLocation = CameraPosition(
    tilt: 60,
    zoom: 12,
      target: LatLng(36.710567, 10.413693));
  @override
  Widget build(BuildContext ctx) {

    double deviceheight = MediaQuery.of(ctx).size.height;
    double devicewidth = MediaQuery.of(ctx).size.width;

    Widget gmap() {
          //print("this is ${orderslist[0].price}");

      return
        Consumer<OrderProvider>(
                  builder: (BuildContext context, value, Widget child) {     return Stack(
            children: [
              Center(
                child: Container(height: deviceheight,
                  child: GoogleMap(
                    
                    buildingsEnabled: true,

                    onTap: (index){
                      mapProvider.polylines.clear();
                      mapProvider.AddMarkers(orderslist, context, _geolocator);
                      //mapProvider.removeClientsMarkers();
                      //mapProvider.markers.clear();
                      mapProvider.notify();
                    },
                    polylines: Set<Polyline>.of(mapProvider.polylines.values),
                    //polylines: ,
                    initialCameraPosition:
                    _initialLocation = CameraPosition(tilt: 60,
                    zoom: 12,
                      target: LatLng(36.710567, 10.413693)),
                    myLocationEnabled: true,

                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    markers: mapProvider.markers.toSet(),
                    
                    //onTap: goto,
                    onMapCreated: (GoogleMapController controller) {
                      mapProvider.AddMarkers(orderslist,context,_geolocator);

                      mapController = controller;
                    },

                  ),
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
                                print("this is"+orderProvider.now);
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<OrderProvider>(
                                            builder: (BuildContext context, value, Widget child) { 
                                              return Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            bottom: 42
                          ),
                          child: orderProvider.timerwidget); },
                                            
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:16.0,bottom: 42),
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
                                mapProvider.getCurrentLocation(_geolocator,_currentPosition,mapController);
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
          ); },
              
        );
    }








    return

       Consumer<MapProvider>(
                builder: (context, mapProvider,child) {
                      return Container(
          height: deviceheight,
            transform: Matrix4.translationValues(
                0.0, deviceheight * 0.037, 0.0),


            child: gmap());
                  },
              
       );


    // TODO: implement build
    throw UnimplementedError();
  }
}
