import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';

class Auth {
  void signUp(BuildContext context, String email, String password, String name,
      WidgetRef ref) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    ref.read(isLoading.notifier).state = true;

    Future.delayed(const Duration(seconds: 1), () async {
      try {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await firestore.collection('users').doc(cred.user!.uid).set(
          {'email': email, 'password': password, 'name': name},
        );
        ref.read(isLoading.notifier).state = false;
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    });
  }
}