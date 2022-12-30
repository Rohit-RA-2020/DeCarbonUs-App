import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffSetButton extends StatefulWidget {
  const OffSetButton({Key? key}) : super(key: key);

  @override
  State<OffSetButton> createState() => _OffSetButtonState();
}

class _OffSetButtonState extends State<OffSetButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.green,
      onPressed: () {},
      child: Text(
        "Start Off-Setting",
        style: GoogleFonts.andika(
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
