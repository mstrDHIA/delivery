
import 'package:delivery_app_v0/Screens/Order.dart';
import 'package:flutter/material.dart';

showOrder(context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Order(),
      ));
}


Widget listitem(context, id) {

  double deviceheight = MediaQuery.of(context).size.height;
  double devicewidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 24, right: 24, left: 24),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 20,
              spreadRadius: 1)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: deviceheight * 0.125,


      width: devicewidth * 0.85,
      child: ListTile(
        onTap: () {
          //  _increment();
          showOrder(context);
        },
        leading: Padding(
          padding: const EdgeInsets.only(top: 6.0, right: 6),
          child: Image.asset('assets/french-fries.png'),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 16),
          child: Text(
            'Order $id',
            style: TextStyle(
              //fontFamily: 'ebrima',
                fontSize: 18),
          ),
        ),
        trailing: Text(
          '$num',
          style: TextStyle(
            //fontFamily: 'ebrima',
              fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'From ',
                    style: TextStyle(
                        fontFamily: 'calist',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),

                ],
              ),
              SizedBox(height: deviceheight * 0.005),
              Row(
                children: [
                  Text(
                    'To ',
                    style: TextStyle(
                        fontFamily: 'calist',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Mohsen Toukebri',
                    style: TextStyle(
                        color: Color.fromRGBO(187, 33, 33, 0.86),
                        fontFamily: 'calist',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}



