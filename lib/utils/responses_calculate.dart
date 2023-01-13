// ignore_for_file: avoid_print

import 'package:decarbonus/screens/responses_analysis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/provider.dart';

void calculateFootprint(
    Map<String, int?> responses, WidgetRef ref, BuildContext context) async {
  var dio = Dio();
  Response results = (await dio
      .post(
        'https://api-account-345807.el.r.appspot.com/calculate',
        data: responses,
      )
      .whenComplete(
        () => {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              ref.read(isLoading.notifier).state = false;
            },
          ),
          Future.delayed(const Duration(milliseconds: 3800), () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const ResponsesAnalysis(),
              ),
            );
          }),
        },
      ));
  ref.read(footprintResultProvider.notifier).state = results.data;

  print(results.data);
}
