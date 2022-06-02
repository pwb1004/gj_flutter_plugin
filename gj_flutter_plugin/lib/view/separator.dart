import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final Color color;

  const Separator({Key? key, this.color = const Color(0xFFF1F1F1)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      color: color,
    );
  }
}
