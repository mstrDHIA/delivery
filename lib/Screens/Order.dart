import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Widgets/popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Orders.dart';
import 'package:shadow/shadow.dart';



class Order extends  StatefulWidget{



  @override
  OrderPage createState() => OrderPage();

}

class OrderPage extends State<Order>{

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
    barapp(String ti) {
      return Column(
        children: [Container(
          color: Color.fromRGBO(211, 16, 39, 0.6),
          height: deviceheight*0.0375,

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
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: devicewidth*0.00,),
                      Text(
                        ti,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'arial',
                            fontWeight: FontWeight.w600

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


    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceheight*0.091),
        child: Column(
          children: [
            barapp("Order 159"),

          ],
        )
      ),
      backgroundColor: Color(0xfffafafa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            blank(),



            Container(
              transform: Matrix4.translationValues(


                  0, -deviceheight * 0.08, 0.0),
              child: Column(
                children: [route(),
                showmap(),
                bill(),
                timer()
                ],
              ),
            )


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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('30DT',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
              ),
              Accept()
            ],
          ),
        ),
      )
      /*BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Opacity(opacity: 0,child: Icon(Icons.more_vert,)),title: Text('30DT')),
          BottomNavigationBarItem(icon:Opacity(opacity: 0,child: Icon(Icons.more_vert,)),title: FlatButton(onPressed: null, child: Text('30DT'))),

        ],
      ),*/
    );




    // TODO: implement build
    throw UnimplementedError();
  }

  blank() {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [

        Container(
          width: devicewidth,
          height: deviceheight*0.32,
          decoration: BoxDecoration(

            image: DecorationImage(
              image: const AssetImage('assets/blank_curve2.png'),
              fit: BoxFit.fill,
            ),

          ),
        ),
        Positioned(
            right: 0,
            top:10,
            child: Image.asset('assets/french-fries.png',)
        ),
      ],
    );
  }

  route() {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,
        right: 20,
        left: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left:16,
                  right: 16

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/location (2).png'),
                  Image.asset('assets/Component 1 – 1.png'),
                  Image.asset('assets/location (3).png'),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Pizzaria Chipotle',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'arial',
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                    'Mohsen Toukebri',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'arial',
                      fontWeight: FontWeight.w700
                  ),),

              ],
            ),


          ],
        ),
      ),
    );


  }

  showmap() {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: FlatButton(
          onPressed: (){
            print('pressed');
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  color: Colors.black26,
                  blurRadius: 6,
                  spreadRadius: 1
                )
              ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffEC5B6C),
                      Color(0xffE33E51),

                ]

                ),
               // color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            width: devicewidth*0.85,
            height: deviceheight*0.08,
            child :Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text(
                      'Show In Map',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          //fontFamily: 'SEGOEUI',
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Image.asset('assets/placeholder (3).png')
                  ]
                ),
              ),
          ),
        ),
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

  bill() {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top:24),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 1,
              offset: Offset(0,2)
            ),

          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5)
          ),
          color: Colors.white
        ),
        width: devicewidth*0.86,
        height: deviceheight*0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           // SizedBox(height: deviceheight*0.00001,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                    'Order Content',
                  style: TextStyle(
                      fontSize: 18,
                    fontFamily: 'calist'
                  ),
                )

              ]
            ),
            Billitem("1 Pizza 4 Seasons Max",15),
            Billitem("1 Pizza 4 Cheese Small",9),
            Billitem("1 Soda 1L",3),
            Billitem("Delivery fees",3),
            Divider(),
            Billitem("Total",30),
            Padding(
              padding: const EdgeInsets.only(right:12.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      'Paid',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,

                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );

  }

  Billitem(String item,double price) {
    return Padding(
      padding: const EdgeInsets.only(left:12,right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            item,
            style: TextStyle(
              fontSize: 17,
                fontFamily: 'calist'

            ),
          ),
          Text(
              "$price DT",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'calist',

                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  timer() {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        right:42,
        left: 42,
        top:30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Delivery Time:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          Container(
            height: deviceheight*0.05,
            width: devicewidth*0.17,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(3)
                ),
                border: Border.all(

                  color: Colors.black,
                  width: 3,
                )
            ),
            child: Center(
              child: Container(
                height: deviceheight*0.035,
                width: devicewidth*0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3)
                  ),
                  border: Border.all(

                    color: Colors.black,
                    width: 3,
                  )
                ),
                child:
                Center(
                    child: Text(
                        '9:00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    )
                )
              ),
            ),
          )
        ],
      ),
    );

  }

}