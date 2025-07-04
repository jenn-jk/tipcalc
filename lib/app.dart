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
    var theme = Theme.of(context);

    // add style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Text("Total per Person", style: style),
                Text('\$20.0', style: style.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: theme.textTheme.displaySmall!.fontSize
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
