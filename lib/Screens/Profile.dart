import 'package:flutter/material.dart';
import 'Edit.dart';
class Profile extends StatefulWidget{
  @override
  ProfilePage createState() => ProfilePage();
}

class ProfilePage extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;




    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            identifier(),
            MonthStats(),
            info(),
          ],
        ),
      ),
    );


    // TODO: implement build
    throw UnimplementedError();
  }





  Widget identifier() {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
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
                 Image.asset(
                     'assets/user (4).png',
                 scale: 2,
                 ),
                 SizedBox(height: deviceheight*0.007,),
                 Text(
                     'Saleh Ben Ali',
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

                   Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(),));
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

  But(){
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

  MonthStats() {
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
            statsbox('Delivery',46,[Color(0xffF0C4A9),Color(0xffE94057),Color(0xffCC2B5E)]),
            statsbox('Stars',123,[Color(0xffEC2A14),Color(0xffF9C34E)]),
            statsbox('Profit',212,[Color(0xffF2BE2A),Color(0xffF94665)]),


          ],
        ),
        SizedBox(height: deviceheight*0.02,),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            But(),
            SizedBox(width: devicewidth*0.062,)
          ],
        )
      ],
    );
  }

  statsbox(String txt,int num,List<Color> c) {
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
                colors: c,
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

  info() {
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

        Line('User Name','Saleh Ben Ali',Colors.white),
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


        Line('Phone Number','12345678',Colors.white),
        Padding(
          padding: const EdgeInsets.only(right:12.0
          ,left: 12),
          child: Divider(          height: 3,
          thickness: 1,color: Colors.black38,),
        ),


        Line('Age','24',Color(0xfffafafa)),

      ]
    );

  }

  Line(String k, String v,Color c) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Container(
      color: c,
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
  }
