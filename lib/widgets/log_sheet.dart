import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import '../providers/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogBottomSheet extends ConsumerWidget {
  const LogBottomSheet({super.key});

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
                : ref.watch(authToken) == 404
                    ? Lottie.asset(
                        'assets/anim/error.json',
                        height: 100.h,
                        width: 100.h,
                      )
                    : Lottie.asset(
                        'assets/anim/complete.json',
                        height: 150.h,
                        width: 150.h,
                      ),
            ref.watch(isLoading)
                ? const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Logging you in...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Andika',
                      ),
                    ),
                  )
                : ref.watch(authToken) == 404
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          ref.watch(authRes).toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Andika',
                          ),
                        ),
                      )
                    : const Text(
                        'Logged in successfully!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Andika',
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
