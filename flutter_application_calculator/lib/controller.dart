import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final selected = "".obs;

  final firstController = TextEditingController();
  final secondController = TextEditingController();

  String get getFirst => firstController.text.trim();
  String get getSecond => secondController.text.trim();

  final resultList = <double>[].obs;

  @override
  void onInit() {
    /*debounce(selected, (_) {
      selected.value = "Add";
    }, time: const Duration(seconds: 1));*/

    super.onInit();
  }

  void firstSecond() {}

  void sum() {
    try {
      final first = double.parse(getFirst);
      final second = double.parse(getSecond);
      addList(first + second);
    } catch (e) {
      //TODO errorr (toast)
    }
  }

  void remove() {
    try {
      final first = double.parse(getFirst);
      final second = double.parse(getSecond);
      addList(first - second);
    } catch (e) {
      //TODO errorr (toast)
    }
  }

  void multiply() {
    try {
      final first = double.parse(getFirst);
      final second = double.parse(getSecond);
      addList(first * second);
    } catch (e) {
      //TODO errorr (toast)
    }
  }

  void divide() {
    try {
      final first = double.parse(getFirst);
      final second = double.parse(getSecond);
      addList(first / second);
    } catch (e) {
      //TODO errorr (toast)

    }
  }

  void addList(double value) {
    if (resultList.length >= 5) {
      resultList.removeAt(0);
    }
    resultList.add(value);
  }

  void clearAll() {
    firstController.clear();
    secondController.clear();
    selected.value = "";
    resultList.clear();
  }
}
