import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.style,
    required this.billAmount,
    required this.theme,
  });

  final TextStyle style;
  final double billAmount;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text("Total Per Person", style: style),
          Text(
            billAmount.toStringAsFixed(2),
            style: style.copyWith(
              color: theme.colorScheme.onPrimary,
              fontSize: theme.textTheme.displaySmall!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
