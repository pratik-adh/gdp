import 'package:flutter/material.dart';

class CounterControllerProvider with ChangeNotifier {
  int _count = 0;

  // get to access the count value outside of the file
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
