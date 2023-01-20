import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decarbonus/models/fade_animation.dart';
import 'package:decarbonus/screens/dashboard.dart';
import 'package:decarbonus/screens/questions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class QuestionWelcomeScreen extends StatefulWidget {
  const QuestionWelcomeScreen({super.key});

  @override
  State<QuestionWelcomeScreen> createState() => _QuestionWelcomeScreenState();
}

class _QuestionWelcomeScreenState extends State<QuestionWelcomeScreen> {
  late String uid;
  String? name;
  bool? isResponded;
  @override
  void initState() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      setState(() {
        name = value.data()!['name'];
        isResponded = value.data()!['isResponded'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (name == null || isResponded == null)
          ? Center(
              child: Lottie.asset('assets/anim/loading.json'),
            )
          : isResponded!
              ? const DashBoard()
              : Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          delay: 0.5,
                          fadeDirection: FadeDirection.bottom,
                          child: Lottie.asset('assets/anim/welcome.json'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        FadeAnimation(
                          fadeDirection: FadeDirection.right,
                          delay: 1,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Welcome to ',
                              style: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'De',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade800,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Carbon',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.brown,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Us',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FadeAnimation(
                          delay: 1.25,
                          fadeDirection: FadeDirection.right,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              name!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        FadeAnimation(
                          delay: 1.5,
                          fadeDirection: FadeDirection.right,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'Before we continue, Please answer some questions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        FadeAnimation(
                          delay: 2,
                          fadeDirection: FadeDirection.top,
                          child: RippleAnimation(
                            color: Colors.green.shade200,
                            repeat: true,
                            child: Hero(
                              tag: 'next',
                              child: ElevatedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Questions(),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  backgroundColor:
                                      const Color.fromARGB(255, 116, 228, 177),
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40.w,
                                    vertical: 15.h,
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 30.sp,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
