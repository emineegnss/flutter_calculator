import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_calculator/controller.dart';
import 'package:flutter_application_calculator/process_model.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class ProcessWidget extends GetView<CalculatorController> {
  const ProcessWidget({Key? key, required this.processModel, required this.isSelected}) : super(key: key);
  final ProcessModel processModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selected.value = processModel.title;
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color(0xff787878),
            ),
            borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: Icon(
            processModel.icon,
          ),
          title: Text(processModel.title),
          trailing: isSelected ? Icon(FeatherIcons.checkCircle) : Icon(FeatherIcons.circle),
        ),
      ),
    );
  }
}
