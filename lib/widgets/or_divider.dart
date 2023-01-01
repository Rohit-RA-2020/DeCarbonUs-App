import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "OR",
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: color,
        height: 1.5,
        thickness: 1,
      ),
    );
  }
}
