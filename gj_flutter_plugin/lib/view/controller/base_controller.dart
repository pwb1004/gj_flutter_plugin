import 'package:flutter/material.dart';

class BaseController {
  VoidCallback? onChanged;

  BaseController({this.onChanged}) : super();

  static void controllerOnChanged(BaseController controller) {
    if (controller.onChanged != null) {
      controller.onChanged!();
    }
  }
}
