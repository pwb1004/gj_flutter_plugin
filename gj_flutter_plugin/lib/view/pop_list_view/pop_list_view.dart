import 'package:flutter/material.dart';
import '../separator.dart';

typedef PageChanged = void Function(int index);

class PopListView extends StatefulWidget {
  final List? list;
  final String? displayKey;
  final bool multiple;
  final Function(Object?)? onSelectionFinished;
  final VoidCallback? onCancel;

  PopListView({
    Key? key,
    this.list,
    this.displayKey,
    this.multiple = false,
    this.onSelectionFinished,
    this.onCancel,
  });

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
      child: Column(
        children: [
          Visibility(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Text(
                        '取消',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: const Color(0xFF2784FB), fontSize: 14.0),
                      ),
                      onTap: () {
                        cancel();
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: Text('确定',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: const Color(0xFF2784FB), fontSize: 14.0)),
                      onTap: () {
                        done();
                      },
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                SizedBox(
                  height: 12,
                ),
                Separator(),
              ],
            ),
            visible: widget.multiple == true,
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
      margin: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
    ));
  }

  Widget buildItem(int index) {
    var data = displayList[index];
    Container con = Container(
      child: Column(
        children: [
          Row(
            children: [
              Visibility(
                child: Image.asset(
                  "images/icon_radio_${data['sel'] == '0' ? 'nor' : 'sel'}.png",
                  width: 16,
                  height: 16,
                ),
                visible: widget.multiple == true,
              ),
              Expanded(
                  child: Text(
                '${data[widget.displayKey]}',
                textAlign: TextAlign.center,
              ))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Separator(),
        ],
      ),
      margin: EdgeInsets.only(top: 12),
      alignment: Alignment.center,
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
    if (selectedList.length > 0) {
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
