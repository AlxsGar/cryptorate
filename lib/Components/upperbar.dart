import 'package:flutter/material.dart';
import 'mainbody.dart';

class UpperBar extends StatefulWidget {
  UpperBar({Key? key}) : super(key: key);

  @override
  State<UpperBar> createState() => _UpperBarState();
}

class _UpperBarState extends State<UpperBar> {
  TextEditingController currencyValue = TextEditingController();
  double mexCurrency = 0;

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
              "\$USD",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: TextField(
                controller: currencyValue,
                onEditingComplete: () {
                  setState(() {
                    if (currencyValue.text.isNotEmpty) {
                      mexCurrency = double.parse(currencyValue.text);
                      MainBody.valueEntered.value = mexCurrency;
                    } else {
                      mexCurrency = 0;
                      MainBody.valueEntered.value = mexCurrency;
                    }
                  });
                  FocusScope.of(context).unfocus();
                },
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
