import 'package:decarbonus/screens/auth/login.dart';
import 'package:decarbonus/widgets/custom_auth_button.dart';
import 'package:decarbonus/widgets/or_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../auth/firebase_auth.dart';
import '../../constants/colors.dart';
import '../../widgets/reg_sheet.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVis = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfffcf7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/signup.png'),
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50.0.w, 5.0.h, 50.0.w, 8.0.h),
                  child: Text(
                    'Create an account, it\'s free 😉',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: _nameController,
                    cursorColor: kSignUpColor,
                    cursorWidth: 2,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xFF3ef7ce),
                      ),
                      focusColor: kSignUpColor,
                      focusedBorder: const UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFF3ef7ce),
                        ),
                      ),
                      hintText: 'Name',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    cursorColor: kSignUpColor,
                    cursorWidth: 2,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFF3ef7ce),
                      ),
                      focusColor: kSignUpColor,
                      focusedBorder: const UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFF3ef7ce),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    cursorColor: kSignUpColor,
                    cursorWidth: 2,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVis,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xFF3ef7ce),
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
                                color: Color(0xFF3ef7ce),
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Color(0xFF3ef7ce),
                              ),
                      ),
                      focusColor: kSignUpColor,
                      focusedBorder: const UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFF3ef7ce),
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
                  builder: (context, ref, child) => CustomAuthButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: const MyBottomSheet(),
                          ),
                        );
                        Auth().signUp(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                          ref,
                          context,
                        );
                        _emailController.clear();
                        _passwordController.clear();
                        _nameController.clear();
                      }
                    },
                    bgColor: kSignUpColor,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const OrDivider(color: Colors.black),
                Consumer(
                  builder: ((context, ref, child) => CustomAuthButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: const MyBottomSheet(),
                            ),
                          );
                          Auth().googleLogin(ref, context);
                        },
                        bgColor: const Color(0xFFfffcf7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              width: 30.w,
                            ),
                            Text(
                              'Sign Up With Google',
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
                        'Already have an account?',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const LogInPage(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          overlayColor: MaterialStateProperty.all(
                            kSignUpColor.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          'Log In',
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
