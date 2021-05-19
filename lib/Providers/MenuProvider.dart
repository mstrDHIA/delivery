import 'package:delivery_app_v0/Screens/CodeScanner.dart';
import 'package:delivery_app_v0/Screens/Report.dart';
import 'package:delivery_app_v0/Screens/blockedBuyers.dart';
import 'package:delivery_app_v0/Screens/login.dart';
import 'package:flutter/material.dart';
//import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/popupMenu.dart';
class MenuProvider extends ChangeNotifier {

  Changeoption(BuildContext context,option) async {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    var result=option;

    notify();
    if(result==MenuOptions.FeedBack){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Report(),));
    }
    if(result==MenuOptions.Settings){
      final pref =  SharedPreferences.getInstance();
                    String blocked =await pref.then((value) => value.getString('blocked'));
      Navigator.push(context, MaterialPageRoute(builder: (context) => blockedUsers(blocked: blocked,),));
     
    }
    if(result==MenuOptions.Logout){
       final prefs = await SharedPreferences.getInstance();  
              final pref =  SharedPreferences.getInstance(); 
              //SharedPreferences mySPrefs = PreferenceManager.getDefaultSharedPreferences(this);


                bool taken=await pref.then((value) => value.getBool('taken'));
                //String blocked=await pref.then((value) => value.getString('blocked'));
                // if(blocked!=null){
                //   //prefs.remove(blocked);
                //   prefs.setString("blocked", null);
                //   print("removed blocked:"+blocked);

                // }

if(!taken){
prefs.setString("logged", "").then((bool success) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),),(route) => false,);
      });
}
else{
  showDialog(context: context,
  builder: (_){return 
  Dialog(
    child: Container(
      height: deviceheight*0.12,
      width: devicewidth*0.3,
      child: Center(child: Column(
        children: [
          SizedBox(height: deviceheight*0.01,),
          Icon(Icons.block,
          color: Colors.red,
          size: 30,),
                    SizedBox(height: deviceheight*0.01,),

          Text("You can't logout before delivering your order",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 16
          ),),
        ],
      ))
      ),
    );}
  );
}
    
    }

    if(result==MenuOptions.Contact){

       IO.Socket socket = IO.io('http://5c874c8db811.ngrok.io',
       );
       print("connected");
       try{socket.onConnect((_) {
     print('connect');
     socket.emit('msg', 'test');
    });}
    catch(e){
      print("impossible"+e);
    }
    
    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  //     final channel = await IOWebSocketChannel.connect('ws://127.0.0.1/:8000');

  // channel.stream.listen((message) {
  //   print(message);
  //   channel.sink.add('received!');
  //   channel.sink.close(status.goingAway);
  // }); //Navigator.push(context, MaterialPageRoute(builder: (context) => Report(),));
    }

    print(option.toString());
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