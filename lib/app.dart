import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipcalc/tip_calc_model.dart';
import 'package:tipcalc/bill_amount_field.dart';
import 'package:tipcalc/person_counter.dart';
import 'package:tipcalc/tip_slider.dart';
import 'package:tipcalc/toggle_theme_button.dart';
import 'package:tipcalc/total_per_person.dart';

class TipCalc extends StatefulWidget {
  const TipCalc({super.key});

  @override
  State<TipCalc> createState() {
    return _TipCalcState();
  }
}

class _TipCalcState extends State<TipCalc> {
  @override
  Widget build(BuildContext context) {
    final tipCalModel = Provider.of<TipCalcModel>(context);
    var theme = Theme.of(context);

    double billAmount = tipCalModel.calcBillTotal();
    double tipAmount = tipCalModel.calcTipTotal();

    // add style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
        actions: [ToggleThemeButton()],
      ),
      body:
          // top area
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TotalPerPerson(
                style: style,
                billAmount: billAmount,
                theme: theme,
              ),

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
                          tipCalModel.updateBillTotal(double.parse(value));
                          // setState(() {
                          //   _billTotal = double.parse(value);
                          // });
                        },
                      ),
                      PersonCounter(
                        theme: theme,
                        personCount: tipCalModel.personCount,
                        onIncrement: tipCalModel.incrementPersonCount,
                        onDecrement: tipCalModel.decrementPersonCount,
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
                            "${(tipCalModel.tipPercentage * 100).round()}%",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),

                      // sliding tip element
                      TipSlider(
                        tipPercentage: tipCalModel.tipPercentage,
                        onChanged: (double value) {
                          tipCalModel.updateTipPercentage(value);
                          // setState(() {
                          //   _tipPercentage = value;
                          // });
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
