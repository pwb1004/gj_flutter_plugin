import 'package:flutter/material.dart';

class BaseController {
  VoidCallback? onChanged;

  String? placeholder;

  BaseController({this.onChanged, this.placeholder}) : super();

  static void controllerOnChanged(BaseController controller) {
    if (controller.onChanged != null) {
      controller.onChanged!();
    }
  }
}
