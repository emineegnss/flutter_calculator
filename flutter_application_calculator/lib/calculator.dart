import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_calculator/controller.dart';
import 'package:flutter_application_calculator/process_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorController controller = Get.put(CalculatorController());
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            width: 500,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.grey[800],
              border: Border.all(width: 5, color: Colors.black),
            ),
            child: Center(
              child: Obx(
                () => controller.resultList.isEmpty
                    ? Text("No action has been selected yet")
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.resultList
                            .map(
                              (e) => Text(e.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                          fontSize: 18))),
                            )
                            .toList(),
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 17),
            child: TextField(
              controller: controller.firstController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "First Number",
                labelStyle: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                hintText: "Enter.",
                hintStyle: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                )),
                contentPadding: EdgeInsets.all(23),
                focusedBorder: new OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 17),
            child: TextField(
              controller: controller.secondController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                  labelText: "Second Number",
                  labelStyle: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15))),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 17),
            child: Column(
              children: Const.process
                  .map(
                    (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Obx(
                          () => ProcessWidget(
                            processModel: e,
                            isSelected: controller.selected.value == e.title,
                          ),
                        )),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.clearAll,
                    child: Text("Clear",
                        style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 17))),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(20, 50),
                        primary: Colors.grey[900],
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28)))),
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        double.parse(controller.getFirst);
                        double.parse(controller.getSecond);
                        if (controller.selected.value == "Add") {
                          controller.sum();
                        } else if (controller.selected.value == "Substract") {
                          controller.remove();
                        } else if (controller.selected.value == "Multiply") {
                          controller.multiply();
                        } else if (controller.selected.value == "Divide") {
                          controller.divide();
                        }
                      } catch (_) {
                        Get.snackbar(
                          "ERROR",
                          "You entered a non-number value",
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.red[400],
                          backgroundColor: Colors.black,
                          borderRadius: 16,
                          animationDuration: Duration(seconds: 2),
                        );
                      }
                      controller.selected.value = "";
                    },
                    child: Text("Calculate",
                        style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 17))),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(20, 50),
                        primary: Colors.grey[900],
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28)))),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
