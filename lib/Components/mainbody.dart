import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:crypto2money/Components/coinfetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'package:http/http.dart' as http;

class MainBody extends StatefulWidget {
  static ValueNotifier<double> valueEntered = ValueNotifier(0);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  Future<List<CoinFetch>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < 10; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(CoinFetch.fromJson(map));
            //log(values[i]);
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(const Duration(seconds: 10), ((timer) => fetchCoin()));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: MainBody.valueEntered,
        builder: (BuildContext context, double receivedValue, Widget? child) {
          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.35,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: CardDesign(
                    imgsURL: coinList[index].imageUrl,
                    name: coinList[index].name,
                    price: coinList[index].price.toDouble(),
                    toConvert: receivedValue / coinList[index].price.toDouble(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
