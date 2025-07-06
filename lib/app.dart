import 'package:flutter/material.dart';
import 'package:tipcalc/bill_amount_field.dart';
import 'package:tipcalc/person_counter.dart';
import 'package:tipcalc/tip_slider.dart';
import 'package:tipcalc/total_per_person.dart';

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
  double _billTotal = 0;
  double _tipTotal = 0;

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

  double calcBillTotal() {
    return ((_billTotal + _billTotal * _tipPercentage) / _personCount);
  }

  double calcTipTotal() {
    return (_billTotal * _tipPercentage);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double billAmount = calcBillTotal();
    double tipAmount = calcTipTotal();

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
              TotalPerPerson(style: style, billAmount: billAmount, theme: theme),

              // main container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      BillAmountField(
                        onChanged: (String value) {
                          setState(() {
                            _billTotal = double.parse(value);
                          });
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
                          Text(
                            "${tipAmount.round()}",
                            style: theme.textTheme.bodyMedium,
                          ),
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
