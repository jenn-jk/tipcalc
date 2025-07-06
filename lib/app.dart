import 'package:flutter/material.dart';
import 'package:tipcalc/person_counter.dart';
import 'package:tipcalc/tip_slider.dart';

class TipCalc extends StatefulWidget {
  @override
  State<TipCalc> createState() {
    return _TipCalcState();
  }
}

class _TipCalcState extends State<TipCalc> {
  // properties
  int _personCount = 1;
  double _tipPercentage = 0;

  // methods
  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

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
      body:
          // top area
          Column(
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
                    Text("Total Per Person", style: style),
                    Text(
                      '\$20.0',
                      style: style.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontSize: theme.textTheme.displaySmall!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),

              // main container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefix: Icon(Icons.attach_money),
                          labelText: "Enter Amount",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      PersonCounter(
                        theme: theme,
                        personCount: _personCount,
                        onIncrement: increment,
                        onDecrement: decrement,
                      ),

                      // tip amount display
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tip", style: theme.textTheme.bodyMedium),
                          Text("\$20", style: theme.textTheme.bodyMedium),
                        ],
                      ),

                      // tip percentage display
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(_tipPercentage * 100).round()}%",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),

                      // sliding tip element
                      TipSlider(
                        tipPercentage: _tipPercentage,
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
