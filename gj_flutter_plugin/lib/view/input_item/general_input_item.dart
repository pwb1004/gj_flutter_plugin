import 'package:flutter/material.dart';
import '../controller/general_input_controller.dart';
import '../separator.dart';

import '../../config/text_style_ms.dart';

class GeneralInputItem extends StatefulWidget {
  final GeneralInputController inputController;
  final Function(int)? onIconTapped;
  final bool required;
  final String? title;
  final IconData? iconData;
  final bool forDisplay;
  final String? placeholder;
  final String? parameterKey;

  const GeneralInputItem(this.inputController,
      {Key? key,
      this.onIconTapped,
      this.required = false,
      this.title,
      this.iconData,
      this.forDisplay = false,
      this.placeholder,
      this.parameterKey});

  @override
  _GeneralInputItemState createState() => _GeneralInputItemState();
}

class _GeneralInputItemState extends State<GeneralInputItem> {
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
              const SizedBox(
                width: 12,
              ),
              Visibility(
                visible: widget.required,
                child: Row(
                  children: const [
                    Text(
                      "*",
                      style: TextStyleMs.red_mask,
                    ),
                    SizedBox(
                      width: 4,
                    )
                  ],
                ),
              ),
              Text(
                "${widget.title}",
                style: const TextStyle(fontSize: 14, color: Color(0xff000000)),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: TextField(
                controller: textController,
                maxLines: null,
                enabled: !widget.forDisplay,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "${widget.placeholder}"),
                textAlign: TextAlign.end,
                style: TextStyleMs.black_14,
                onChanged: (value) {
                  widget.inputController.subtitle = textController.text;
                },
              )),
              Visibility(
                visible: widget.iconData != null,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      child: Icon(widget.iconData),
                      onTap: () {
                        if (widget.onIconTapped != null) {
                          widget.onIconTapped!(0);
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const Separator()
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
