import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefix: Icon(Icons.attach_money),
        labelText: "Enter Amount",
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
