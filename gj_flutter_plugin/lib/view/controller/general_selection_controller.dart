import 'base_controller.dart';

class GeneralSelectionController extends BaseController {
  String? displayValue;
  Map<String, dynamic>? storageValue;
  String? saveKey;

  GeneralSelectionController(
      {this.displayValue, this.storageValue, this.saveKey, String? placeholder})
      : super(placeholder: placeholder);
}
