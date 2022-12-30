import 'dart:ui';
import 'package:decarbonus/screens/components/buttons.dart';
import 'package:decarbonus/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'text_fields.dart';

class SignUpComponent extends StatefulWidget {
  const SignUpComponent({Key? key}) : super(key: key);

  @override
  State<SignUpComponent> createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: GoogleFonts.andika(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              const TextFieldContainer(
                name: "Name",
                tDouble: 100,
                bDouble: 15,
                icon: Icons.abc_sharp,
              ),
              const TextFieldContainer(
                name: "Email",
                tDouble: 20,
                bDouble: 20,
                icon: Icons.email,
              ),
              const TextFieldContainer(
                name: "Password",
                tDouble: 10,
                bDouble: 20,
                icon: Icons.lock,
              ),
              const ButtonContainer(
                name: "Submit",
                screen: DashBoardScreen(),
              ),
              const SizedBox(
                height: 100,
                child: Divider(
                  thickness: 3,
                  indent: 50,
                  endIndent: 50,
                ),
              ),
              Text(
                "OR",
                style: GoogleFonts.andika(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/google_logo.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    iconSize: 50,
                    color: Colors.blueAccent,
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.facebook),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
