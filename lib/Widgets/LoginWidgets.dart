import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Providers/ProfileProvider.dart';
import 'package:delivery_app_v0/Providers/blockedUsersProvider.dart';
import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';

verify(LoginProvider loginprovider){
  
}
roundedtop(context) {
  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            offset: Offset(0, 3),
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
            ])),
    height: deviceheight * 0.35,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: deviceheight * 0.05),
        Center(
          child: Opacity(
            opacity: 0.9,
            child: Center(
                child: Image.asset(
                  'assets/logo white2.png',
              //'assets/gift white.png',
              scale: 2.8,
            )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 8),
              child: Opacity(
                opacity: 0.8,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}






InputWidget({ProfileProvider profileProvider,String placeholder, Icon ic, context,TextEditingController controller,bool ispassword,keyboardtype}) {
  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  
 // final requiredValidator = RequiredValidator(errorText: 'this field is required'
 //);


 

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(right: 35, left: 35, top: 15, bottom: 8),
      child: Opacity(
        opacity: 0.7,
        child: Container(
          height: deviceheight * 0.065,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6,
                    offset: Offset(1, 4))
              ],
              borderRadius: BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: Colors.black, width: 0.3)),
          child: Stack(children: [
            
            Opacity( 
                opacity: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 2),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.redAccent,
                    ),
                    child: TextFormField(
                      keyboardType: keyboardtype,
                      /*validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },*/
                      //autovalidate: true,
                      //validator: requiredValidator,
                      obscureText: ispassword,
                      controller: controller,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                          prefixIcon: ic,
                          //labelText: "$placeholder",
                          //alignLabelWithHint: true,
                          border: InputBorder.none,
                          hintText: "$placeholder",
                          contentPadding: EdgeInsets.only(
                            top: 14,
                          )),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    ),
  );
}


  

  


EditInputWidget({ProfileProvider profileProvider,String placeholder, Icon ic, context,TextEditingController controller,bool ispassword,keyboardtype,value}) {
  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  
 // final requiredValidator = RequiredValidator(errorText: 'this field is required'
 //);

  if(value!=null){
    if(!profileProvider.change){
    controller.text=value;
    
    }
  }

 

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(right: 35, left: 35, top: 15, bottom: 8),
      child: Opacity(
        opacity: 0.7,
        child: Container(
          height: deviceheight * 0.065,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    blurRadius: 6,
                    offset: Offset(1, 4))
              ],
              borderRadius: BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: Colors.black, width: 0.3)),
          child: Stack(children: [
            
            Opacity( 
                opacity: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 2),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.redAccent,
                    ),
                    child: TextFormField(
                      keyboardType: keyboardtype,
                      /*validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },*/
                      //autovalidate: true,
                      //validator: requiredValidator,
                      obscureText: ispassword,
                      controller: controller,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                          prefixIcon: ic,
                          //labelText: "$placeholder",
                          //alignLabelWithHint: true,
                          border: InputBorder.none,
                          hintText: "$placeholder",
                          contentPadding: EdgeInsets.only(
                            top: 14,
                          )),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    ),
  );
}



But({blockedUsersProvider blockedProvider,confirm,context, provider,logprovider,username,email,password,whattodo,formkey,String uservalid,String passwordvalid}) {
  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  return Container(
    child: Stack(children: [
      Center(
        child: Text(whattodo,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
      ),
      Opacity(
          opacity: 0,
          child: RaisedButton(
            onPressed: () async {
              if(whattodo=="Register"){
                provider.passwordvalid="";
    provider.emailvalid="";
    provider.uservalid="";
    provider.confirmvalid="";
  provider.notify();
                if(provider.registeremailvalidation(email.text)){

                if(provider.registerpasswordvalidation(password.text)){
                if(provider.confirmpasswordvalidation(confirm.text,password.text)){
                print(provider.uservalid);

                provider.Register(context, username.text, password.text,email.text,logprovider);
                print("this is"+provider.uservalid);
                }
                else{
                  provider.regwidcon=Center(
                child: 
                Text(
                  provider.confirmvalid,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                  ),
                  )
                );
                }
                }
                else{
                  provider.regwidpass=Center(
                child: 
                Text(
                  provider.passwordvalid,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                  ),
                  )
                );
                }
                }
                else{
                   provider.regwidemail=Center(
                child: 
                Text(
                  provider.emailvalid,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                  ),
                  )
                );
                }
              }
              else if(whattodo=="Login"){
                provider.uservalidation(username.text);
                provider.passwordvalidation(password.text);
                                 

                  
                 if (formkey.currentState.validate()) {
                  provider.Login(context, username.text, password.text,blockedProvider);
                }
                

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                 // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                
                 print(uservalid);
              }
              
                provider.notify();

                
    
                

              
              //loginprovider.notify();
            },
          )),
    ]),
    width: devicewidth * 0.35,
    height: deviceheight * 0.06,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 25,
              spreadRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.16))
        ],
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(227, 62, 81, 1),
              const Color.fromRGBO(236, 91, 108, 1)
            ])),
  );
}

Soc(String img, double sc) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 40,
            spreadRadius: 10,
            color: Color.fromRGBO(0, 0, 0, 0.16))
      ]),
      child: Image.asset(
        img,
        scale: sc,
      ),
    ),
  );
}

Link(String msg, String lnk, Widget wid,context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        msg,
        style: TextStyle(fontSize: 15),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => wid));
        },
        child: Text(
          lnk,
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      )
    ],
  );
}
