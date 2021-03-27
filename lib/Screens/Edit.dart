import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Widgets/popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget{
  @override
  EditPage createState() => EditPage();
}

class EditPage extends State<Edit> {
  MenuProvider menuProvider;
  @override
  void initState() {
    menuProvider = Provider.of<MenuProvider>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(child: barapp("Edit Profile"), preferredSize: Size.fromHeight(deviceheight*0.11)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            identifier(),
            editform()
          ],
        ),
      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,-1),
                    spreadRadius: 1,
                    blurRadius: 20,
                    color: Colors.black12
                ),
              ],
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left:34.0,
                right: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Accept()
              ],
            ),
          ),
        )
    );

    // TODO: implement build
    throw UnimplementedError();
  }
  barapp(String ti) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Column(
      children: [Container(
        color: Color.fromRGBO(211, 16, 39, 0.6),
        height: deviceheight*0.026,

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
                left: 0
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    IconButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: devicewidth*0.00,),
                    Text(
                      ti,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),

                    ),
                  ],
                ),

                Menu(context,menuProvider)
              ],
            ),
          )
      ),
      ],
    );
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
                  Container(
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
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }


  Accept() {

    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top:12.0,
          bottom: 12),
      child: FlatButton(
        onPressed: (){
          print('pressed');
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

  InputWidget(String placeholder,Icon ic){
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            right: 40,
            left: 40,
            top: 32
        ),
        child: Opacity(opacity: 0.7,
          child: Container(
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
                          child: TextFormField(
                            cursorColor: Colors.redAccent,
                            decoration: InputDecoration(
                                prefixIcon: ic,

                                border: InputBorder.none,
                                hintText: "$placeholder",

                                contentPadding: EdgeInsets.only(
                                  top: 14,

                                )
                            ),

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
  editform(){
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InputWidget("Saleh Ben Ali",Icon(Icons.person,)),
        InputWidget("Saleh",Icon(Icons.person,)),
        InputWidget("Ben Ali",Icon(Icons.person,)),
        InputWidget("Saleh.B.Ali@gmail.com",Icon(Icons.alternate_email,)),
        InputWidget("Motor Cycle",Icon(Icons.motorcycle,)),
        InputWidget("12345678",Icon(Icons.phone,)),
        InputWidget("Tunis Beb Bhar",Icon(Icons.location_city,)),
        InputWidget("************",Icon(Icons.lock,)),
        SizedBox(height: deviceheight*0.05,)



      ],
    );
  }

}



