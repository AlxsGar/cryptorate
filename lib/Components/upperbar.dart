import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 75, 108, 244),
      ),
      child: Row(
        children: [
          Container(
            child: Text(
              "\$MEX",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Cantidad',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.attach_money_rounded),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
