import 'package:get/get.dart';

class CounterControllerGetx extends GetxController {
  final RxInt count = 0.obs;
  RxString myValue = "Getx".obs;

  // get to access the count value outside of the file

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  void reset() {
    count.value = 0;
  }
}
