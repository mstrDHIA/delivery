import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Widgets/popupMenu.dart';
import 'package:flutter/material.dart';



barapp({String ti,BuildContext context,MenuProvider menuprovider}) {
  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  return Column(
    children: [Container(
      color: Color.fromRGBO(211, 16, 39, 0.6),
      height: deviceheight*0.0365,

    ),
    Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0,3),
                  blurRadius: 13,
                  spreadRadius: 2
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                  //const Color.fromRGBO(211, 16, 39, 1),
                  //const Color.fromRGBO(245, 123, 138, 1),
                  Color(0xddD31027),
                  Color(0xbaF64B60)

                ]
            )
        ),
        width: devicewidth,
        height: deviceheight*0.09,
        child:Padding(
          padding: const EdgeInsets.only(
              right:8,
              left: 24
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      icon:Icon( Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 28,),
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                  Text(
                    ti,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'arial'
                    ),

                  ),
                ],
              ),



              Row(
                children: [
                  Icon(
                    Icons.notifications,
                      color: Colors.white,
                      size: 28,),

                  /*IconButton(
                    onPressed: null,
                    icon: Icon( Icons.more_vert,
                      color: Colors.white,
                      size: 28,),
                  ),*/
                  Menu(context,menuprovider)
                ],
              )
            ],
          ),
        )
    ),
    ],
  );



  /*AppBar(
        actions: [
          Icon(
              Icons.more_vert,
              color: Colors.white,
          ),
          SizedBox(width: devicewidth*0.03,)
        ],
        toolbarHeight: deviceheight*0.08,
        backgroundColor: Colors.redAccent,
        title: Text(ti),
      );*/
}