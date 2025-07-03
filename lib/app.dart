import 'package:flutter/material.dart';

class TipCalc extends StatefulWidget {
  @override
  State<TipCalc> createState() {
    return _TipCalcState();
  }
}

class _TipCalcState extends State<TipCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(children: [Text("Total per Person"), Text('\$20.0')]),
          ),
        ],
      ),
    );
  }
}
