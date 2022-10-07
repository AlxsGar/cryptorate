import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  CardDesign({
    required this.name,
    required this.imgsURL,
    required this.price,
    required this.toConvert,
  });

  String name;
  String imgsURL;
  double price;
  double toConvert;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      //margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 246, 246),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.network(
                    imgsURL,
                    height: 50,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  toConvert.toStringAsFixed(5),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  '1 = \$$price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
