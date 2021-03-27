import 'package:flutter/material.dart';
import '../main.dart';
import 'Register.dart';
import 'AppController.dart';



class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LoginPage();
    // TODO: implement build
    throw UnimplementedError();
  }

}

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double deviceheight=MediaQuery.of(context).size.height;
    double devicewidth=MediaQuery.of(context).size.width;
    roundedtop(){
      return Container(

        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0,0,0, 0.16),
                blurRadius: 6,
                offset: Offset(0,3),
              )
            ],


            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(110),
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromRGBO(211, 16, 39, 1),
                  const Color.fromRGBO(234, 90, 107, 1),


                ]
            )
        ),


        height:deviceheight *0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: deviceheight*0.05),
            Center(
              child: Opacity(
                opacity: 0.9,
                child: Center(child:
                Image.asset('assets/gift white.png',scale: 1.5,)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24,
                    top: 8
                  ),
                  child: Opacity(opacity: 0.8,
                    child: Text('Login',style: TextStyle(
                        fontSize: 24,

                        color: Colors.white
                    ),

                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
    InputWidget(String placeholder,Icon ic){

      return Center(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 40,
              left: 40,
              top: 32,
            bottom: 8

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

    But(){
      return Container(
        child: Stack(
            children: [
              Center(
                child: Text(
                    'Login',
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )
                ),
              ),
              Opacity(
                  opacity: 0,
                  child: RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppController()));
                  },)
              ),
            ]
        ),
        width: devicewidth*0.35,
        height: deviceheight*0.06,


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
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromRGBO(227, 62, 81, 1),
                  const Color.fromRGBO(236, 91, 108, 1)

                ]


            )
        ),
      );
    }

    Soc(String img,double sc){
      return Padding(
        padding: const EdgeInsets.only(
            top:16 ,
            left:30,
            right:30
        ),
        child: Container(decoration: BoxDecoration(
            boxShadow: [BoxShadow(
                offset: Offset(0,6),
                blurRadius:40,

                spreadRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.16)
            )]
        ),
          child: Image.asset(img,
            scale: sc,
          ),
        ),
      );
    }

    Link(String msg , String lnk,Widget wid){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(msg,
            style: TextStyle(
                fontSize: 15
            ),
          ),
          TextButton(


            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => wid));
            },
            child: Text(lnk,
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),),
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              roundedtop(),
              Padding(
                padding: const EdgeInsets.only(
                    top:16.0),
                child: InputWidget("User Name",Icon(Icons.person)),
              ),
              InputWidget("Password",Icon(Icons.lock)),
              Padding(
                padding: const EdgeInsets.only(
                    top:36.0,
                    bottom: 8
                ),
                child: But(),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top:16.0,
                      bottom: 16

                  ),

                  child: Column(
                    children: [
                      Link("Don't have an account","Register",Register()),

                      Link("Forgot your password","Click Here",MyApp()),
                    ],
                  )
              ),
              Text(
                'Or',
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 20,
                    fontWeight: FontWeight.w400

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10,
                    left:16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Soc('assets/google.png',1.5),
                    Soc('assets/twitter.png',2.5),
                    Soc('assets/facebook.png',4.3),


                  ],
                ),
              )

            ],
          ),
        )
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
