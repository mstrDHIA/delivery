import 'package:delivery_app_v0/Providers/RegisterProvider.dart';
import 'package:delivery_app_v0/Widgets/LoginWidgets.dart';
import 'package:delivery_app_v0/Widgets/RegisterWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Register extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return RegisterPage();
    // TODO: implement build
    throw UnimplementedError();
  }
}

class RegisterPage extends StatefulWidget {
  

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterProvider registerProvider;
  @override
  void initState() {
    registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    registerProvider.passwordvalid="";
    registerProvider.emailvalid="";
    registerProvider.uservalid="";
    registerProvider.confirmvalid="";

    registerProvider.regwidemail=SizedBox(height: 0,);

    registerProvider.regwidpass=SizedBox(height: 0,);

    // TODO: implement initState
    super.initState();
  }


  
    final usernamecontrol=TextEditingController();
    final passwordcontrol=TextEditingController();
    final emailcontrol=TextEditingController();
    final confirmcontrol=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceheight=MediaQuery.of(context).size.height;
    double devicewidth=MediaQuery.of(context).size.width;
    final String whattodo="Register";


    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: Consumer<RegisterProvider>(
              builder: (BuildContext context, value, Widget child) { 
                 return SingleChildScrollView(
          child: Column(
            children: [
              regroundedtop(context,),
              SizedBox(height: deviceheight*0.04,),
              Form(
                child: Column(children: [
              InputWidget(placeholder:"Email",ic:Icon(Icons.alternate_email,),context:context,controller: emailcontrol,ispassword: false,keyboardtype: TextInputType.emailAddress),
              //registerProvider.regwidemail,
              Text(
                registerProvider.emailvalid,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                  ),
                ),

              
              InputWidget(placeholder:"User Name",ic:Icon(Icons.person,),context:context,controller: usernamecontrol,ispassword: false,keyboardtype: TextInputType.text),
              Text(
                registerProvider.uservalid,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                  ),
                ),

              InputWidget(placeholder:"Password",ic:Icon(Icons.lock,),context:context,controller: passwordcontrol,ispassword: true,keyboardtype: TextInputType.text),
              Text(
                registerProvider.passwordvalid,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                  ),
                ),
              //registerProvider.regwidpass,

             
              InputWidget(placeholder:"Confirm Password",ic:Icon(Icons.lock,),context:context,controller: confirmcontrol,ispassword: true,keyboardtype: TextInputType.text),
              registerProvider.regwidcon,
              
              Padding(
                padding: const EdgeInsets.only(
                    top:36.0,
                    bottom: 2
                ),
                child: But(confirm: confirmcontrol,username: usernamecontrol,email:emailcontrol,context:context,whattodo:whattodo,provider: registerProvider,password: passwordcontrol),
              ),
              ],),),
              
              Padding(
                padding: const EdgeInsets.only(
                    top:16.0,
                    bottom: 4

                ),

                child: Link("Have an account already","Login",Login(),context)
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
                  top: 4,
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
        );
 
               },
                  )
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}