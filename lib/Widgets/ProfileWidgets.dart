//import 'dart:js';

import 'dart:convert';

import 'package:delivery_app_v0/API/APIS.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Providers/ProfileProvider.dart';
import 'package:delivery_app_v0/Screens/createProfile.dart';
import 'package:flutter/material.dart';

import 'LoginWidgets.dart';

Widget radioWidget({context,ProfileProvider profileProvider}){
  //int sex=1;
  double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return
    Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [SizedBox(height: deviceheight*0.02,),
      Row(
        children: [
          SizedBox(width: devicewidth*0.15,),
          Opacity(opacity: 0.7,child: Text("Sex:",style: TextStyle(fontSize: 18),)),
        ],
      ),
        
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Row(children: [
            
 Radio(groupValue: profileProvider.sex,
            autofocus: true,
            value:"Male",
            activeColor: Colors.red,
            onChanged: (value){
              profileProvider.chooseSex(value);
            },),
                    Text("Male"),
          ],),
            // ignore: missing_required_param
            Row(children: [ Radio(groupValue: profileProvider.sex,
            activeColor: Colors.red,

            value:"Female",
            onChanged: (value){
              profileProvider.chooseSex(value);
            },),
                    Text("Female"),],)

            

          ],
        ),
      ],
    );
}

Widget createidentifier({context,ProfileProvider profileProvider}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    Widget photo;
    if(profileProvider.selected==null){
       photo=Image.asset(
                    'assets/user (4).png',
                    scale: 2,
                  );
    }
    else{
      photo=ClipOval(
              child: Image.asset(
          
          profileProvider.selected.path,
                      scale: 1,
                      fit: BoxFit.fill,
                         width: devicewidth*0.35,
                         height: deviceheight*0.17,),
      );
    }
    return Container(
      width: devicewidth*1,
      height: deviceheight*0.3,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0x10000000),
                offset: Offset(0,20),
                blurRadius: 30,
                spreadRadius: 1
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(devicewidth/2,deviceheight/5.5),
            bottomRight:Radius.elliptical(devicewidth/2,deviceheight/5.5),
          )
      ),
      child: Stack(

        children: [
          
          Center(
            child: Container(
              transform: Matrix4.translationValues(
                  0, deviceheight * 0.03, 0.0),
              child: Column(
                children: [
                  photo,
                  // Image.asset(
                  //   'assets/user (4).png',
                  //   scale: 2,
                  // ),
                  SizedBox(height: deviceheight*0.007,),
            //       ClipOval(
            //                           child: Container(decoration: BoxDecoration(
            //                             color: Color(0xffeeeeee),
            //                             boxShadow: [BoxShadow(
            //                              color: Color(0x10000000),
            //  offset: Offset(0,20),
            //  blurRadius: 30,
            //  spreadRadius: 1)]
            //                           ),
            //           width: devicewidth*0.12,
            //           height: deviceheight*0.056,
            //           child: IconButton(
            //             onPressed: (){
            //               profileProvider.imageselect();
            //               //Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(),));
            //             }, icon: Icon(Icons.photo),
            //           ),
            //         ),
            //       )
                ],
              ),
            ),
          ),
          Positioned(bottom: deviceheight*0.1,left: devicewidth*0.57,
            child:  ClipOval(
                                      child: Container(decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        boxShadow: [BoxShadow(
                                         color: Color(0x10000000),
             offset: Offset(0,20),
             blurRadius: 30,
             spreadRadius: 1)]
                                      ),
                      width: devicewidth*0.12,
                      height: deviceheight*0.056,
                      child: IconButton(
                        onPressed: (){
                          profileProvider.imageselect();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(),));
                        }, icon: Icon(Icons.photo),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }



Accept({context,ProfileProvider profileProvider,age,city,phone,address,LoginProvider loginProvider}) {

    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top:12.0,
          bottom: 12),
      child: FlatButton(
        onPressed: (){
          profileProvider.createprofile(context: context,age:age,city:city,phone:phone,address:address,loginProvider: loginProvider);
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 2
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff71DF79),
                    Color(0xff2ACF45),

                  ]

              ),
              // color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          width: devicewidth*0.4,
          height: deviceheight*0.058,
          child :Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Accept',style: TextStyle(color: Colors.white,fontSize: 16),),

                ]
            ),
          ),
        ),
      ),
    );
  }



  Widget identifier({context,User user}) {
     double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    //String photo='assets/user (4).png';
    Widget photo;
    if(user.profile.photo!=null){
        photo=ClipOval(
                                    child: Image.network(
                       initiallink+user.profile.photo,
                       fit: BoxFit.fill,
                       width: devicewidth*0.4,
                       height: deviceheight*0.2,
                   scale: 1,
                   ),
                 );
    }
    else{
      photo=Image.asset(
        "assets/user (4).png",
        scale: 2,
      );
    }
   return Container(
     width: devicewidth*1,
     height: deviceheight*0.3,
     decoration: BoxDecoration(
       boxShadow: [
         BoxShadow(
             color: Color(0x10000000),
             offset: Offset(0,20),
             blurRadius: 30,
             spreadRadius: 1
         )
       ],
       color: Colors.white,
       borderRadius: BorderRadius.only(
     bottomLeft: Radius.elliptical(devicewidth/2,deviceheight/5.5),
     bottomRight:Radius.elliptical(devicewidth/2,deviceheight/5.5),
   )
     ),
     child: Stack(

       children: [
         Center(
           child: Container(
             transform: Matrix4.translationValues(


                 0, deviceheight * 0.03, 0.0),
             child: Column(
               children: [
                 photo,
                 SizedBox(height: deviceheight*0.007,),
                 Text(
                     '${user.username}',
                      style: TextStyle(
                        fontSize: 28
                      ),
                 )
               ],
             ),
           ),
         ),
         Positioned(
           right: devicewidth*0.04,
           top: -deviceheight*0.005,
           child: Container(
             width: devicewidth*0.1,
             height: deviceheight*0.1,
             child: FloatingActionButton(

                 onPressed: (){

                   Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProfile(),));
                 },
               child: Image.asset(
                   'assets/edit (1).png',

               ),

             ),
           )
         ),

       ],
     ),
   );
  }



   SelectWidget({String placeholder,Icon ic,context,ispassword,keyboardtype,List<String> items,ProfileProvider profileProvider}){
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
        String selecteditem;

    if(placeholder=="Vehicle"){
        selecteditem=profileProvider.vehicleval;
    }
    else if(placeholder=="Country"){
        selecteditem=profileProvider.countryval;
    }
    else if(placeholder=="State"){
        selecteditem=profileProvider.stateval;
    }
    return Center(
      
      child: Padding(
        padding: const EdgeInsets.only(
            right: 28,
            left: 28,
            top: 14
        ),
        child: Opacity(opacity: 0.7,
          child: Container(
            width: devicewidth*0.83,
            height: deviceheight*0.065,
            decoration: BoxDecoration(
                color:Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      blurRadius: 6,
                      offset: Offset(1,4)


                  )
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(100)
                ),
                border: Border.all(
                    color: Colors.black,

                    width: 0.3
                )
            ),
            child: Stack(

                children:[

                  /* Padding(
                    padding: const EdgeInsets.only(
                      top: 14,
                      left: 14
                    ),
                    child: Icon(Icons.email),
                  ),*/
                  Opacity(
                      opacity: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            top: 2
                        ),
                        child: Theme(
                          data:  Theme.of(context)
                              .copyWith(primaryColor: Colors.redAccent,),
                          child: new DropdownButton(
                            focusColor: Colors.red,
                            
                            value: selecteditem,
                            
                  hint: Container(width: devicewidth*0.71,
                  child: Row(
                    
                    children: [SizedBox(width: devicewidth*0.025,),
                      Opacity(opacity: 0.7,
                      child: ic),
                      SizedBox(width: devicewidth*0.035,),
                      Text("$placeholder"),
                    ],
                  ),),
         
          onChanged: (String value) {
            if(placeholder=="Vehicle"){
            profileProvider.changevehicle(value);
                        print(profileProvider.vehicleval);

            }
            else if(placeholder=="Country"){
            profileProvider.changeCountry(value);
                        profileProvider.stateval=null;

            profileProvider.whichStates();
            print(profileProvider.countryval);

            }
            else if(placeholder=="State"){
            profileProvider.changeState(value);
            print(profileProvider.stateval);

            }
            profileProvider.notify();
            //print(selecteditem);
                          // selecteditem=value;
                          // profileProvider.notify();

            
          },
           items: items.map((String valueitem) {
            return new DropdownMenuItem(
              value: valueitem,
              child: new Text(valueitem),
            );
          }).toList(),
        ),
                        ),
                      )
                  ),]
            ),
          ),
        ),
      ),
    );
  }
  editform({context,ProfileProvider profileProvider,firstnamecontrol,lastnamecontrol,agecontrol,addresscontrol,citycontrol,phonecontrol}){
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InputWidget(controller: firstnamecontrol,context: context,placeholder: "first name",ispassword: false,ic:Icon(Icons.person),keyboardtype: TextInputType.name ),
        InputWidget(controller: lastnamecontrol,context: context,placeholder: "last name",ispassword: false,ic:Icon(Icons.person),keyboardtype: TextInputType.name ),
        radioWidget(context: context,profileProvider: profileProvider),
         InputWidget(context: context,controller: agecontrol,placeholder: "age",ispassword: false,ic:Icon(Icons.date_range),keyboardtype: TextInputType.number ),       
        InputWidget(context: context,controller: phonecontrol,placeholder: "phone number",ispassword: false,ic:Icon(Icons.phone),keyboardtype: TextInputType.phone ),
        SelectWidget(profileProvider:profileProvider ,items: ["motor cycle","car","bicycle"],context: context,placeholder: "Vehicle",ispassword: false,ic:Icon(Icons.motorcycle),keyboardtype: TextInputType.phone ),
        SelectWidget(profileProvider:profileProvider ,items: ["Tunisia","China","Italy"],context: context,placeholder: "Country",ispassword: false,ic:Icon(Icons.location_city),keyboardtype: TextInputType.phone ),
        SelectWidget(profileProvider:profileProvider ,items: profileProvider.states,context: context,placeholder: "State",ispassword: false,ic:Icon(Icons.location_city),keyboardtype: TextInputType.phone ),
        InputWidget(context: context,controller: citycontrol,placeholder: "City",ispassword: false,ic:Icon(Icons.location_city),keyboardtype: TextInputType.text ),

        InputWidget(context: context,controller: addresscontrol,placeholder: "Address",ispassword: false,ic:Icon(Icons.place),keyboardtype: TextInputType.streetAddress ),
        // InputWidget("Saleh",Icon(Icons.person,)),
        // InputWidget("Ben Ali",Icon(Icons.person,)),
        // InputWidget("Saleh.B.Ali@gmail.com",Icon(Icons.alternate_email,)),
        // InputWidget("Motor Cycle",Icon(Icons.motorcycle,)),
        // InputWidget("12345678",Icon(Icons.phone,)),
        // InputWidget("Tunis Beb Bhar",Icon(Icons.location_city,)),
        // InputWidget("************",Icon(Icons.lock,)),
        SizedBox(height: deviceheight*0.05,)



      ],
    );
  }


  But({context}){
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

    return Container(

      child: Stack(
          children: [
            Center(
              child: Text(
                  'More...',
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )
              ),
            ),
            Opacity(
                opacity: 0,
                child: RaisedButton(onPressed: (){
                  print("pressed");
                },)
            ),
          ]
      ),
      width: devicewidth*0.25,
      height: deviceheight*0.045,


      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0,6),
                blurRadius:25,

                spreadRadius: 8,
                color: Color.fromRGBO(0, 0, 0, 0.16)
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: RadialGradient(

              colors: [
                const Color(0xffEC5B6C),
                const Color(0xffE33E51)

              ]


          )
      ),
    );
  }

  MonthStats({context,user}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        SizedBox(height: deviceheight*0.03,),
        Text(
          'Month Stats',
          style: TextStyle(
              fontSize: 28
          ),
        ),
        SizedBox(
          height: deviceheight*0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            statsbox(txt:'Delivery',num:46,colors:[Color(0xffF0C4A9),Color(0xffE94057),Color(0xffCC2B5E)],context: context),
            statsbox(txt:'Stars',num:123,colors:[Color(0xffEC2A14),Color(0xffF9C34E)],context: context),
            statsbox(txt:'Profit',num:212,colors:[Color(0xffF2BE2A),Color(0xffF94665)],context: context),


          ],
        ),
        SizedBox(height: deviceheight*0.02,),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            But(context: context),
            SizedBox(width: devicewidth*0.062,)
          ],
        )
      ],
    );
  }

  statsbox({String txt,int num,List<Color> colors,context,user}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

      return Column(
        children: [
          Container(
            child: Center(

              child: Text(
                  '$num',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            height: deviceheight*0.1,
            width: devicewidth*0.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,3),
                  blurRadius: 6,
                  color: Colors.red[200],
                  spreadRadius: 2
                )
              ],
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )
            ),
          ),
          SizedBox(height: deviceheight*0.01,),
          Text(
              txt,
            style: TextStyle(
              color: Color(0xffC42929),
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      );
  }

  info({context,User user}) {
    
    List<Widget> infos=List();
    String userprofiletxt=jsonEncode(user.profile);
    Color color;
    int i=0;
    List<String> userprofile=userprofiletxt.split(",");
    String usertxt=jsonEncode(user);
    List<String> userlist=usertxt.split(",");
    List<String> keyvalue;
    for(String infor in userlist){
            keyvalue=infor.split(':');
            if(keyvalue[0]!='{"id"'){
        if(keyvalue[0]!='"password"'){
            if(keyvalue[0]!='"last_login"'){
if(keyvalue[0]!='"is_superuser"'){
if(keyvalue[0]!='"is_staff"'){
if(keyvalue[0]!='"is_active"'){
if(i%2!=0){color=Color(0xfffafafa);}
else{color=Color(0xffffffff);}
i++;
                      infos.add(Line(k:keyvalue[0],v:keyvalue[1],color:color,context: context));
                    }            }            }            }      
          }
      }
      print(infor);
    }
    for(String profileinfo in userprofile){
      keyvalue=profileinfo.split(':');
      if(keyvalue[0]!='{"id"'){
        if(keyvalue[0]!='"id_user"'){
if(keyvalue[0]!='"state"'){
if(keyvalue[0]!='"lat"'){
if(keyvalue[0]!='"long"'){
if(keyvalue[0]!='"photo"'){
  if(i%2!=0){color=Color(0xfffafafa);}
else{color=Color(0xffffffff);}
i++;
          infos.add(Line(k:keyvalue[0],v:keyvalue[1],color:color,context: context));
        }        }        }        }        }
      }
      print(profileinfo);
    }
    
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Column(
      children:[
        SizedBox(height: deviceheight*0.04,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Profile Information',
                style: TextStyle(
                  fontSize: 30
                ),
            )
          ],

        ),
        SizedBox(height: deviceheight*0.02,),

        /*Line('User Name','Saleh Ben Ali',Colors.white),
        Padding(
          padding: const EdgeInsets.only(right:12.0
              ,left: 12),
          child: Divider(          height: 3,
            thickness: 1,color: Colors.black38,),
        ),
        Line('First Name','Saleh',Color(0xfffafafa)),
        Padding(
          padding: const EdgeInsets.only(right:12.0
              ,left: 12),
          child: Divider(          height: 3,
            thickness: 1,color: Colors.black38,),
        ),


        Line('Last Name','Ben Ali',Colors.white),

        Padding(
          padding: const EdgeInsets.only(right:12.0
              ,left: 12),
          child: Divider(          height: 3,
            thickness: 1,color: Colors.black38,),
        ),

        Line('Email','Saleh.B.Ali@gmail.com',Color(0xfffafafa)),
    Padding(
    padding: const EdgeInsets.only(right:12.0
    ,left: 12),
    child: Divider(          height: 3,
    thickness: 1,color: Colors.black38,),
    ),


        Line('Phone Number','12345678',Colors.white),*/
        Padding(
          padding: const EdgeInsets.only(right:12.0
          ,left: 12),
          child: Divider(          height: 3,
          thickness: 1,color: Colors.black38,),
        ),

        for(var item in infos) item,

        //Line(k:'Age',v:'24',color:Color(0xfffafafa),context: context),
        
      ]
    );

  }

  Line({String k, String v,Color color,context,user}) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(
            top:16.0,
          bottom: 16,
          left: 24,
          right: 24
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                k,
                style: TextStyle(
                  fontSize: 18
                ),
            ),
            Text(
                v,
              style: TextStyle(
                  fontSize: 18
              ),)
          ],
        ),
      ),
    );
  }