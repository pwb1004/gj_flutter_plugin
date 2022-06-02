import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './vp_search_controller.dart';
import '../separator.dart';

class VPSearchView extends StatefulWidget {
  final VPSearchController? controller;
  final String placeholder;
  final Function(String)? onSearch;

  const VPSearchView(
      {Key? key,
      this.placeholder = '请输入您要搜索的信息',
      this.controller,
      this.onSearch});

  @override
  _VPSearchViewState createState() => _VPSearchViewState();
}

class _VPSearchViewState extends State<VPSearchView> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller?.onChanged = onValueChanged;
      textController.text = widget.controller?.keyWord ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: CupertinoSearchTextField(
                backgroundColor: Colors.white,
                placeholder: widget.placeholder,
                controller: textController,
                onSubmitted: (value) => goSearch(),
                style:
                    const TextStyle(color: Color(0xFF000000), fontSize: 14.0),
              )),
              TextButton(
                  onPressed: () {
                    goSearch();
                  },
                  child: const Text(
                    "搜索",
                    style: TextStyle(color: Color(0xFF2784FB), fontSize: 14.0),
                  ))
            ],
          ),
          const Separator()
        ],
      ),
    );
  }

  goSearch() {
    if (widget.controller != null) {
      widget.controller?.keyWord = textController.text;
    }
    if (widget.onSearch != null) {
      widget.onSearch!(textController.text);
    }
  }

  onValueChanged() {
    textController.text = widget.controller?.keyWord ?? '';
    setState(() {});
  }
}
