// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decarbonus/screens/charts.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/provider.dart';

void calculateFootprint(
    Map<String, int?> responses, WidgetRef ref, BuildContext context) async {
  var dio = Dio();
  FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  Response results = Response(
    requestOptions: RequestOptions(path: ''),
    statusCode: 0,
    data: {},
  );
  try {
    await dio
        .post(
          'https://api-account-345807.el.r.appspot.com/calculate',
          data: responses,
        )
        .then((value) => results = value);
  } catch (e) {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        ref.read(isLoading.notifier).state = false;
        ref.read(statuscode.notifier).state = results.statusCode!;
      },
    );
  }

  if (results.statusCode == 200) {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        ref.read(isLoading.notifier).state = false;
        ref.read(statuscode.notifier).state = results.statusCode!;
      },
    );
    Future.delayed(
      const Duration(milliseconds: 2800),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => const ChartsPage(),
          ),
          (route) => false,
        );
      },
    );
    ref.read(footprintResultProvider.notifier).state = results.data;
    collectionReference.doc(auth.currentUser!.uid).update({
      'responses': responses,
      'results': results.data,
      'isResponded': true,
    });
  } else {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        ref.read(isLoading.notifier).state = false;
        ref.read(statuscode.notifier).state = results.statusCode!;
      },
    );
  }
}
