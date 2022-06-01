import 'package:flutter/material.dart';
import '../controller/general_input_controller.dart';
import '../separator.dart';

class RemarkViewItem extends StatefulWidget {
  final GeneralInputController inputController;
  final bool required;
  final String title;
  final bool forDisplay;
  final String? placeholder;
  final String? parameterKey;

  const RemarkViewItem(this.inputController,
      {Key? key,
      this.required = false,
      this.title = '',
      this.forDisplay = false,
      this.placeholder,
      this.parameterKey});

  @override
  _RemarkViewItemState createState() => _RemarkViewItemState();
}

class _RemarkViewItemState extends State<RemarkViewItem> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.inputController.onChanged = onValueChanged;
    textController.text = widget.inputController.subtitle ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Visibility(
                child: Row(
                  children: [
                    Text(
                      "*",
                      style: TextStyle(color: const Color(0xFFf21c0f), fontSize: 14.0),
                    ),
                    SizedBox(
                      width: 4,
                    )
                  ],
                ),
                visible: widget.required,
              ),
              Text("${widget.title}", style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              SizedBox(
                width: 40,
              ),
              Expanded(
                  child: TextField(
                controller: textController,
                maxLines: null,
                enabled: !widget.forDisplay,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    hintText: "${widget.placeholder ?? ''}",
                    contentPadding: EdgeInsets.all(6)),
                textAlign: TextAlign.end,
                onChanged: (text){
                  widget.inputController.subtitle = textController.text;
                },
                style: TextStyle(color: const Color(0xFF000000), fontSize: 14),
              )),
              SizedBox(
                width: 12,
              ),
            ],
          ),
          SizedBox(height: 4,),
          Separator(),
        ],
      ), margin: EdgeInsets.only(top: 4),
    );
  }

  onValueChanged() {
    textController.text = widget.inputController.subtitle ?? '';
    if (mounted) {
      setState(() {});
    }
  }
}
