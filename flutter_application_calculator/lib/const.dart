import 'package:flutter/material.dart';
import 'package:flutter_application_calculator/process_model.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Const {
  static final process = <ProcessModel>[
    ProcessModel(
      icon: Icons.add,
      title: "Add",
    ),
    ProcessModel(
      icon: Icons.remove,
      title: "Substract",
    ),
    ProcessModel(
      icon: FeatherIcons.x,
      title: "Multiply",
    ),
    ProcessModel(
      icon: Icons.percent,
      title: "Divide",
    )
  ];
}
