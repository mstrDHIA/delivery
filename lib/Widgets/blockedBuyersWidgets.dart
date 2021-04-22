import 'package:delivery_app_v0/Models/block.dart';
import 'package:flutter/material.dart';


blockedbuyer(Blocks block,blockProvider,loginProvider,context){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(block.buyerEmail),
          FlatButton(onPressed: (){
            blockProvider.unblockBuyer(block,loginProvider,context);
            loginProvider.notify();
          }, child: Text("Unblock"))
          ],
          
      ),
      Divider()
    ],
  );
}