import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/OrderProvider.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:delivery_app_v0/Providers/FeedBackProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget{

  @override
  ReportPage createState() => ReportPage();


}

class ReportPage extends State<Report>{
  MenuProvider menuProvider;
    OrderProvider orderProvider;

    FeedBackProvider feedbackProvider;
TextEditingController objectcontrol=TextEditingController();
    TextEditingController contentcontrol=TextEditingController();
  @override
  void initState() {
    menuProvider = Provider.of<MenuProvider>(context, listen: false);
        orderProvider = Provider.of<OrderProvider>(context, listen: false);

        feedbackProvider = Provider.of<FeedBackProvider>(context, listen: false);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    

    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceheight*0.089),
        child: barapp(ti:'FeedBack', context:context, menuprovider: menuProvider,orderProvider: orderProvider),
      ),
      body: SingleChildScrollView(
              child: Center(
          child: Column(
            children: [
              SizedBox(height: deviceheight*0.04,),
                            //     SizedBox(height: deviceheight*0.05,),
Opacity(opacity: 0.7,
                          child: Text('If you had any problem please tell us about it because we care about our costumer\'s experience ',
                style: TextStyle(
                  fontSize: 20,
                  
                ),
                textAlign: TextAlign.center,),
              ),
                            SizedBox(height: deviceheight*0.05,),

              
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 30,
                      spreadRadius: 2,
                      offset: Offset(2,4)
                    )
                  ],
                  // border: Border.all(width: 2,
                  // color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                                                                             SizedBox(height: deviceheight*0.02,),

                      Image.asset("assets/logo just monkey.png",
                      scale: 1.5,),
                      
                                                       SizedBox(height: deviceheight*0.015,),

                      Container(width: devicewidth*0.7,
                child: 
              Column(
                children: [

                  Opacity(opacity: 0.7,
                              child: Text('Tell us what happened',
                    style: TextStyle(
                      fontSize: 20,
                      
                    ),
                    textAlign: TextAlign.center,),
                    
                  ),
                  
                                                     // SizedBox(height: deviceheight*0.01,),

                  
                ],
              )
              
              ),
              
             
                      Container(
                        width: devicewidth*0.8,
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "Object",

                          ),

                          controller: objectcontrol,
                        ),
                      ),
                      Container(width: devicewidth*0.8,
                    child: TextFormField(
                      maxLines: null,
                      
                      decoration: InputDecoration(
                        labelText: "Content",

                        
                      ),
                      controller: contentcontrol,
                    ),
                  ),
                  SizedBox(height: deviceheight*0.05,),
                  FlatButton(onPressed: (){
                    feedbackProvider.sendFeedBack(context,objectcontrol.text, contentcontrol.text);
                  }, child: Text("Send FeedBack",
                  style: TextStyle(color: Colors.red),))
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}