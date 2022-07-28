import 'package:flutter/material.dart';
import '../separator.dart';

typedef PageChanged = void Function(int index);

class PopListView extends StatefulWidget {
  final List? list;
  final String? displayKey;
  final bool multiple;
  final Function(Object?)? onSelectionFinished;
  final VoidCallback? onCancel;

  const PopListView({
    Key? key,
    this.list,
    this.displayKey,
    this.multiple = false,
    this.onSelectionFinished,
    this.onCancel,
  }) : super(key: key);

  @override
  _PopListViewState createState() => _PopListViewState();
}

class _PopListViewState extends State<PopListView> {
  List displayList = [];

  @override
  void initState() {
    super.initState();
    displayList = List.of(widget.list ?? []);
    if (widget.multiple == true) {
      for (Map one in displayList) {
        one['sel'] = '0';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Column(
        children: [
          Visibility(
            visible: widget.multiple == true,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: const Text(
                        '取消',
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Color(0xFF2784FB), fontSize: 14.0),
                      ),
                      onTap: () {
                        cancel();
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: const Text('确定',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Color(0xFF2784FB), fontSize: 14.0)),
                      onTap: () {
                        done();
                      },
                    )),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Separator(),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: displayList.length,
            itemBuilder: (BuildContext context, int index) {
              return buildItem(index);
            },
          ))
        ],
      ),
    ));
  }

  Widget buildItem(int index) {
    var data = displayList[index];
    Container con = Container(
      margin: const EdgeInsets.only(top: 12),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Visibility(
                visible: widget.multiple == true,
                child: Image.asset(
                  "images/icon_radio_${data['sel'] == '0' ? 'nor' : 'sel'}.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Expanded(
                  child: Text(
                '${data[widget.displayKey]}',
                textAlign: TextAlign.center,
              ))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Separator(),
        ],
      ),
    );
    return InkWell(
      child: con,
      onTap: () {
        onItemTapped(index);
      },
    );
  }

  onItemTapped(int index) async {
    Map map = displayList[index];
    if (widget.multiple == true) {
      map['sel'] = map['sel'] == '0' ? '1' : '0';
      setState(() {});
    } else {
      if (widget.onSelectionFinished != null) {
        widget.onSelectionFinished!([map]);
      }
    }
  }

  done() {
    List selectedList = [];
    for (Map one in displayList) {
      if (one['sel'] == '1') {
        selectedList.add(one);
      }
    }
    if (selectedList.isNotEmpty) {
      if (widget.onSelectionFinished != null) {
        widget.onSelectionFinished!(selectedList);
      }
    } else {
      if (widget.onSelectionFinished != null) {
        widget.onSelectionFinished!(null);
      }
    }
  }

  cancel() {
    if (widget.onCancel != null) {
      widget.onCancel!();
    }
  }
}
