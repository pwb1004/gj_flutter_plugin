import './base_controller.dart';

class GeneralInputController extends BaseController {
  String? subtitle;
  String? saveKey;

  GeneralInputController({this.subtitle, this.saveKey, String? placeholder}) : super(placeholder: placeholder);
}
