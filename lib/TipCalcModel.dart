import 'package:flutter/material.dart';

class TipCalcModel extends ChangeNotifier {
  // properties
  int _personCount = 1;
  double _tipPercentage = 0;
  double _billTotal = 0;
  double _tipTotal = 0;

  // getters
  int get personCount => _personCount;
  double get tipPercentage => _tipPercentage;
  double get billTotal => _billTotal;
  double get tipTotal => _tipTotal;

  // methods
  void incrementPersonCount() {
    _personCount++;
    notifyListeners();
  }

  void decrementPersonCount() {
    if (_personCount > 1) {
      _personCount--;
      notifyListeners();
    }
  }

  void updateTipPercentage(double newTipPercentage) {
    _tipPercentage = newTipPercentage;
    notifyListeners();
  }

  void updateBillTotal(double newBillTotal) {
    _billTotal = newBillTotal;
    notifyListeners();
  }

  double calcBillTotal() {
    return ((_billTotal + _billTotal * _tipPercentage) / _personCount);
  }

  double calcTipTotal() {
    return (_billTotal * _tipPercentage);
  }
}
