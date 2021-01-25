import 'package:flutter/material.dart';
import 'package:flutter_ui_complexity/CreditCardUi/data.dart';

class CardDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              width: 250,
              child: Image.asset("assets/images/mastercardlogo.png")),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: customShadow,
                borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0,left: 10,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("**** **** **** ",style: TextStyle(fontSize: 20,color: Colors.black)),
                    Text("5527",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                ),
                Text("PLATINUM CARD",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
