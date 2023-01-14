import 'package:decarbonus/providers/provider.dart';
import 'package:decarbonus/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsesAnalysis extends ConsumerStatefulWidget {
  const ResponsesAnalysis({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResponsesAnalysisState();
}

class _ResponsesAnalysisState extends ConsumerState<ResponsesAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your carbon footprint is:',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Andika',
              ),
            ),
            Text(
              ref.watch(footprintResultProvider)['result'].toString(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const DashBoard(),
                  ),
                );
              },
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}
