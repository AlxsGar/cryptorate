import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';

class MainBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CardDesign(
            imgsURL: 'https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=010',
            name: 'BTC',
            price: 60000,
          ),
          // CardDesign(),
        ],
      ),
    );
  }
}
