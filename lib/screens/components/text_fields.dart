import 'package:flutter/material.dart';


class TextFieldContainer extends StatelessWidget {
  final String name;
  final double tDouble;
  final double bDouble;
  final IconData icon;

  const TextFieldContainer({
    Key? key,
    required this.name,
    required this.tDouble,
    required this.bDouble,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(top: tDouble, bottom: bDouble, right: 20, left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: const Border(
          top: BorderSide(
            color: Colors.black45,
          ),
          bottom: BorderSide(
            color: Colors.black45,
          ),
          left: BorderSide(
            color: Colors.black45,
          ),
          right: BorderSide(
            color: Colors.black45,
          ),
        ),
        color: Colors.white.withOpacity(0.4),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: name,
          border: InputBorder.none,
          fillColor: Colors.white,
          icon: Icon(
            icon,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
