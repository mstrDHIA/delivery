import 'package:flutter/material.dart';

RegInputWidget({String placeholder, Icon ic, context,TextEditingController controller,bool ispassword}) {
  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  
 // final requiredValidator = RequiredValidator(errorText: 'this field is required'
 //);

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(right: 35, left: 35, top: 32, bottom: 8),
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
                      onFieldSubmitted: (value){
                      },
                      obscureText: ispassword,
                      controller: controller,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                          prefixIcon: ic,                         
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



regroundedtop(context) {
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
          bottomLeft: Radius.circular(110),
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
                                    'assets/logo white3.png',

              //'assets/gift white.png',
              scale: 2.8,
              
            )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 8),
              child: Opacity(
                opacity: 0.8,
                child: Text(
                  'Register ',
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