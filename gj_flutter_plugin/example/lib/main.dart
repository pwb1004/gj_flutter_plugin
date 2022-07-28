import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:gj_flutter_plugin/view/cell_item/general_cell_item.dart';
import 'package:gj_flutter_plugin/view/controller/general_input_controller.dart';
import 'package:gj_flutter_plugin/view/remark_view_item/remark_view_item.dart';
import 'package:gj_flutter_plugin/view/search_view/vp_search_view.dart';
import 'package:gj_flutter_plugin/view/separator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GeneralInputController _inputController = GeneralInputController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Separator(),
            const VPSearchView(),
            RemarkViewItem(
              _inputController,
              title: '备注',
              required: true,
            ),
            const GeneralCellItem(
              title: 'cell item with no tap action',
            ),
            GeneralCellItem(
              title: 'cell item with tap action',
              onTap: () => log('cell on tapped'),
            ),
          ],
        ),
      ),
    );
  }
}
