// import 'dart:ffi';

import 'package:flutter/material.dart';

const Color firstColor = Color.fromARGB(255, 9, 173, 50);
const Color secondColor = Color.fromARGB(255, 243, 46, 46);

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final num quantity;
  // final String? notification;
  final Function onIncTap;
  final Function onDecTap;

  final Function onAddCartTap;

  final TextStyle textStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[800]);

  ProductCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price,
      this.quantity = 0,
      // required this.notification,
      required this.onIncTap,
      required this.onDecTap,
      required this.onAddCartTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 10, right: 10),
          width: 130,
          // height: (notification != null) ? 270 : 250,
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  offset: Offset(1, 1),
                  color: Colors.black.withOpacity(0.3),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: secondColor),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(" ",
                  style: textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ))),
        ),
        // notifikasi
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage("images/sorabi.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      name,
                      style: textStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      price,
                      style:
                          textStyle.copyWith(fontSize: 12, color: firstColor),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 140,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: firstColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => onDecTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: () => onIncTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 140,
                      child: ElevatedButton(
                          onPressed: onAddCartTap(),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(firstColor),
                          ),
                          child: Icon(
                            Icons.add_chart,
                            size: 18,
                            color: Colors.white,
                          )))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
