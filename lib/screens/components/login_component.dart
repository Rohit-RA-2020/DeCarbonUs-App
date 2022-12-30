import 'dart:ui';
import 'package:decarbonus/screens/components/text_fields.dart';
import 'package:decarbonus/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'buttons.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Log In",
              style: GoogleFonts.andika(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            const TextFieldContainer(
              name: "Email",
              icon: Icons.email,
              tDouble: 100,
              bDouble: 20,
            ),
            const TextFieldContainer(
              name: "Password",
              tDouble: 10,
              bDouble: 20,
              icon: Icons.lock,
            ),
            const ButtonContainer(
              name: 'Submit',
              screen: SignUpScreen(),
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
    );
  }
}
