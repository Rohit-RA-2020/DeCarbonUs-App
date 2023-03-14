import 'package:decarbonus/constants/colors.dart';
import 'package:decarbonus/screens/auth/login.dart';
import 'package:decarbonus/screens/auth/signup.dart';
import 'package:decarbonus/screens/teams_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_auth_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfef4e8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50.0.w, 8.0.h, 50.0.w, 8.0.h),
                  child: Text(
                    'We\'re  glad to see you here on your journey to a greener future',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF71716f),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Image.asset('assets/images/welcome.png'),
                // Create two buttons
                CustomAuthButton(
                  bgColor: const Color(0xFFfef4e8),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                CustomAuthButton(
                  bgColor: kWelcomeColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0.w, 8.0.h, 30.0.w, 8.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Got a Team Code?',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const TeamsCode(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          overlayColor: MaterialStateProperty.all(
                            const Color(0xFFfedd6c).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          'Join a team',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
