import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function()? onTap;

  const SubmitButton(
      {Key? key,
      required this.title,
      this.color = Colors.blueAccent,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: const EdgeInsets.only(left: 12, right: 12),
      child: ElevatedButton(
          onPressed: () {
            onTap!();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          child: Text(title)),
    );
  }
}
