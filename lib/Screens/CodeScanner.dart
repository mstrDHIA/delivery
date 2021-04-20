import 'dart:io';

import 'package:delivery_app_v0/Models/Orders.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Widgets/OrderWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


//void main() => runApp(MaterialApp(home: QRViewExample()));

class QRViewExample extends StatefulWidget {
  final Orders order;
  
  const QRViewExample({
    Key key, this.order,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState(order);
}

class _QRViewExampleState extends State<QRViewExample> {
    final Orders order;

  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  OrderProvider orderProvider;

  _QRViewExampleState(this.order);
  @override
  void initState() {
    print(order.price);
    // TODO: implement initState
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
    //orderProvider.scanpage=true;
    super.initState();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return WillPopScope(onWillPop:()async{
         orderProvider.which=SingleChildScrollView(child: Column(children:[singleorder(order: order,orderProvider: orderProvider,context:context),
      cam(context: context,provider: orderProvider,order: order),
      confirm(context:context,order: order,provider: orderProvider)]
      ));  
            orderProvider.scanpage=false;

      orderProvider.notify();
    }, /*orderProvider.getback(context, order, orderProvider),*/
          child: Scaffold(
        body: Consumer<OrderProvider>(
                builder: (BuildContext context, value, Widget child) { 
                  return Column(
            children: <Widget>[
              Expanded(
                            child: Stack(children: [
                //               Positioned(bottom: 20,
                // right: 20,
                //   child: IconButton(icon: Icon(Icons.flash_on), onPressed: null)),
                  Expanded(flex: 4, child: _buildQrView(context,order)),
                  
                              Positioned(bottom: deviceheight*0.04,
                              right: deviceheight*0.03,
                                child: FloatingActionButton(
                                  onPressed: () async {
                                  await controller?.toggleFlash();
                                  setState(() {});
                                },
                                  child: Icon(Icons.flash_on),
                                  backgroundColor: Colors.red)
                                  ),
                
                ]),
              ),
              // Expanded(
              //   flex: 1,
              //   child: FittedBox(
              //     fit: BoxFit.contain,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: <Widget>[
              //         if (result != null)
              //           Text(
              //               'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
              //         else
              //           Text('Scan a code'),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: <Widget>[
              //             Container(
              //               margin: EdgeInsets.all(8),
              //               child: ElevatedButton(
              //                   onPressed: () async {
              //                     await controller?.toggleFlash();
              //                     setState(() {});
              //                   },
              //                   child: FutureBuilder(
              //                     future: controller?.getFlashStatus(),
              //                     builder: (context, snapshot) {
              //                       return Text('Flash: ${snapshot.data}');
              //                     },
              //                   )),
              //             ),
              //             Container(
              //               margin: EdgeInsets.all(8),
              //               child: ElevatedButton(
              //                   onPressed: () async {
              //                     await controller?.flipCamera();
              //                     setState(() {});
              //                   },
              //                   child: FutureBuilder(
              //                     future: controller?.getCameraInfo(),
              //                     builder: (context, snapshot) {
              //                       if (snapshot.data != null) {
              //                         return Text(
              //                             'Camera facing ${describeEnum(snapshot.data)}');
              //                       } else {
              //                         return Text('loading');
              //                       }
              //                     },
              //                   )),
              //             )
              //           ],
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: <Widget>[
              //             Container(
              //               margin: EdgeInsets.all(8),
              //               child: ElevatedButton(
              //                 onPressed: () async {
              //                   await controller?.pauseCamera();
              //                 },
              //                 child: Text('pause', style: TextStyle(fontSize: 20)),
              //               ),
              //             ),
              //             Container(
              //               margin: EdgeInsets.all(8),
              //               child: ElevatedButton(
              //                 onPressed: () async {
              //                   await controller?.resumeCamera();
              //                 },
              //                 child: Text('resume', style: TextStyle(fontSize: 20)),
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          );
                 },
                
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context, order) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
              orderProvider.scanpage=false;

        orderProvider.scannedinfo=result.code;
        orderProvider.verifOrder(order:order);
        
orderProvider.which=SingleChildScrollView(child: Column(children:[singleorder(order: order,orderProvider: orderProvider,context:context),
      cam(context: context,provider: orderProvider,order: order),
      confirm(context:context,order: order,provider: orderProvider)]
      ));  
      orderProvider.notify();      
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
