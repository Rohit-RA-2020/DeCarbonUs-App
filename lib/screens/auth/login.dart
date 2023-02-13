import 'package:decarbonus/screens/auth/signup.dart';
import 'package:decarbonus/widgets/custom_auth_button.dart';
import 'package:decarbonus/widgets/log_sheet.dart';
import 'package:decarbonus/widgets/or_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/firebase_auth.dart';
import '../../constants/colors.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVis = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECEA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/log.png'),
              Text(
                "Log in",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0.w, 5.0.h, 50.0.w, 8.0.h),
                child: Text(
                  'We are glad to see you again 🤗',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xFF71716f),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0.w, 8.0.h, 30.0.w, 8.0.h),
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: kLogColor,
                  cursorWidth: 2,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xFFe5d0bb),
                    ),
                    focusColor: kLogColor,
                    focusedBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xFFe5d0bb),
                      ),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF71716f),
                      fontWeight: FontWeight.w600,
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF71716f),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0.w, 8.0.h, 30.0.w, 8.0.h),
                child: TextFormField(
                  controller: _passwordController,
                  cursorColor: kLogColor,
                  cursorWidth: 2,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isVis,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFFe5d0bb),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVis = !isVis;
                        });
                      },
                      icon: isVis
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: Color(0xFFe5d0bb),
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Color(0xFFe5d0bb),
                            ),
                    ),
                    focusColor: kLogColor,
                    focusedBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xFFe5d0bb),
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF71716f),
                      fontWeight: FontWeight.w600,
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF71716f),
                      ),
                    ),
                  ),
                ),
              ),
              Consumer(
                builder: ((context, ref, child) => CustomAuthButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: const LogBottomSheet(),
                          ),
                        );
                        Auth().logIn(
                          _emailController.text,
                          _passwordController.text,
                          ref,
                          context,
                        );
                      },
                      bgColor: kLogColor,
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
              ),
              const OrDivider(color: Colors.black),
              Consumer(
                builder: ((context, ref, child) => CustomAuthButton(
                      onPressed: () {
                        Auth().googleLogin(ref, context);
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: const LogBottomSheet(),
                          ),
                        );
                      },
                      bgColor: const Color(0xFFECECEA),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google_logo.png',
                            width: 30.w,
                          ),
                          Text(
                            'Sign In With Google',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0.w, 0.0, 30.0.w, 8.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w300),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        overlayColor: MaterialStateProperty.all(
                          kLogColor.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
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
    );
  }
}
