import 'package:flutter/material.dart';

class GooglePixel44XL6 extends StatelessWidget {
  GooglePixel44XL6({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-4.0, 71.0),
            child:
                // Adobe XD layer: '150-1505858_blue-li…' (shape)
                Container(
              width: 416.0,
              height: 174.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/blank_curve.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
