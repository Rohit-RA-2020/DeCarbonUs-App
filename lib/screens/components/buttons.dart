import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonContainer extends StatelessWidget {
  final Widget screen;
  final String name;
  const ButtonContainer({
    Key? key, required this.name, required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.green,
      ),
      width: 100,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
        child: Text(
          name,
          style: GoogleFonts.andika(
            textStyle:
            const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
      ),
    );
  }
}