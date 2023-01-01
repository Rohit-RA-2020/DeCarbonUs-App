import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    Key? key,
    required this.child,
    required this.bgColor,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Color bgColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0.w, 8.0.h, 30.0.w, 8.0.h),
      child: SizedBox(
        width: 400.w,
        height: 50.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            backgroundColor: bgColor,
            side: const BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
