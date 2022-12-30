import 'package:decarbonus/constants/colors.dart';
import 'package:decarbonus/screens/login.dart';
import 'package:decarbonus/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0.w, 8.0.h, 30.0.w, 8.0.h),
                  child: SizedBox(
                    width: 400.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the login page
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const LogInPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        elevation: 0,
                        backgroundColor: const Color(0xFFfef4e8),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0.w, 8.0.h, 30.0.w, 8.0.h),
                  child: SizedBox(
                    width: 300.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        elevation: 0,
                        backgroundColor: kWelcomeColor,
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                // Create a button for team members
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
                          // Navigate to the team code page
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
