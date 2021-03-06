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
      this.parameterKey})
      : super(key: key);

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
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Visibility(
                visible: widget.required,
                child: Row(
                  children: const [
                    Text(
                      "*",
                      style:
                          TextStyle(color: Color(0xFFf21c0f), fontSize: 14.0),
                    ),
                    SizedBox(
                      width: 4,
                    )
                  ],
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 14, color: Color(0xff000000)),
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                  child: TextField(
                controller: textController,
                maxLines: null,
                enabled: !widget.forDisplay,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    hintText: widget.placeholder ?? '',
                    contentPadding: const EdgeInsets.all(6)),
                textAlign: TextAlign.end,
                onChanged: (text) {
                  widget.inputController.subtitle = textController.text;
                },
                style: const TextStyle(color: Color(0xFF000000), fontSize: 14),
              )),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Separator(),
        ],
      ),
    );
  }

  onValueChanged() {
    textController.text = widget.inputController.subtitle ?? '';
    if (mounted) {
      setState(() {});
    }
  }
}
