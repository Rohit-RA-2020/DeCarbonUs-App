import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamsCode extends StatefulWidget {
  const TeamsCode({super.key});

  @override
  State<TeamsCode> createState() => _TeamsCodeState();
}

class _TeamsCodeState extends State<TeamsCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/email.png"),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Enter Code",
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Enter the code you recieved via email:",
              style: TextStyle(color: Colors.grey, fontSize: 16.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).primaryColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Didn't recieve a code yet?",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Resend"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Continue →",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.green.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
        isExtended: true,
        backgroundColor: Colors.green.shade100,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
