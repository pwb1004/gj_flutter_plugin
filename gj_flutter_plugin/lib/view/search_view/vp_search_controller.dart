import 'package:flutter/cupertino.dart';

class VPSearchController extends ChangeNotifier {
  String? keyWord;

  VoidCallback? onChanged;

  VPSearchController({this.onChanged, this.keyWord}) : super();
}
