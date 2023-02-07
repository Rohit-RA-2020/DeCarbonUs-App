import 'package:decarbonus/screens/question_welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import '../providers/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsesBottomSheet extends ConsumerWidget {
  const ResponsesBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ref.watch(isLoading)
                ? const SpinKitDoubleBounce(
                    color: Color(0xFFe5d0bb),
                    size: 50.0,
                  )
                : ref.watch(statuscode) == 200
                    ? Lottie.asset(
                        'assets/anim/complete.json',
                        height: 150.h,
                        width: 150.h,
                      )
                    : Lottie.asset(
                        'assets/anim/error.json',
                        height: 150.h,
                        width: 150.h,
                      ),
            ref.watch(isLoading)
                ? const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Submitting your responses...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Andika',
                      ),
                    ),
                  )
                : ref.watch(statuscode) == 200
                    ? const Text(
                        'Responses submitted successfully!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Andika',
                        ),
                      )
                    : const Text(
                        'Error submitting responses!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Andika',
                        ),
                      ),
            SizedBox(height: 20.h),
            ref.watch(statuscode) != 200 && ref.watch(isLoading) == false
                ? SizedBox(
                    width: 150.w,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFe5d0bb),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const QuestionWelcomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        'Retry',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Andika',
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
