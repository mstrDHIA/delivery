import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Screens/AdminManage.dart';
import 'package:delivery_app_v0/Widgets/LoginWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'Register.dart';
import 'AppController.dart';



class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
    // TODO: implement build
    throw UnimplementedError();
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    //TextEditingController usernamecontrol;
    //TextEditingController passwordcontrol;
    final usernamecontrol=TextEditingController();
    final passwordcontrol=TextEditingController();

  final formKey = GlobalKey<FormState>();
    String uservalid;
    String passwordvalid;

    LoginProvider loginProvider;
  @override
  void initState() {
     

    // TODO: implement initState
      loginProvider = Provider.of<LoginProvider>(context, listen: false);
      loginProvider.uservalid="";
     loginProvider.passwordvalid="";
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    double deviceheight=MediaQuery.of(context).size.height;
    double devicewidth=MediaQuery.of(context).size.width;
    
      final String whattodo="Login";

    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SingleChildScrollView(
          child: Consumer<LoginProvider>(
                      builder: (BuildContext context, value, Widget child) {  
                      return Column(
              children: [
                roundedtop(context),
                SizedBox(height: deviceheight*0.03,),
                Form(
                  key: formKey,
                                  child:Column(
                                    children: [Padding(
                    padding: const EdgeInsets.only(
                        top:16.0),
                    child: InputWidget(placeholder:"User Name",ic:Icon(Icons.person),context:context,controller:usernamecontrol,ispassword: false,keyboardtype: TextInputType.text),
                  ),
                  Text(loginProvider.uservalid,
                   style:TextStyle(
                          color: Colors.red,
                          fontSize: 15

                        ) ,),
                InputWidget(placeholder:"Password",ic:Icon(Icons.lock),context:context,controller:passwordcontrol,ispassword: true,keyboardtype: TextInputType.text),
                  Text(loginProvider.passwordvalid,
                   style:TextStyle(
                          color: Colors.red,
                          fontSize: 15
                        ) ,),
                  

                Padding(
                  padding: const EdgeInsets.only(
                      top:16.0,
                      bottom: 0
                  ),
                  child: But(context:context,provider:loginProvider,username:usernamecontrol,password:passwordcontrol,whattodo: whattodo,formkey: formKey),
                ),],
                                  )
                ),
                
                
                Padding(
                    padding: const EdgeInsets.only(
                        top:0.0,
                        bottom: 16

                    ),

                    child: Column(
                      children: [
                        
                        Text(
                          loginProvider.msg,
                           style:TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          

                        ) ,),
                        Link("Don't have an account","Register",Register(),context),

                        Link("Forgot your password","Click Here",AdminManage(),context),
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
            );}
          ),
        )
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
