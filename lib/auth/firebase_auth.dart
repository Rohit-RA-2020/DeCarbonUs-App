import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';

class Auth {
  void signUp(String email, String password, String name, WidgetRef ref) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    ref.read(isLoading.notifier).state = true;
    ref.read(authRes.notifier).state = 'waiting';
    ref.read(authToken.notifier).state = 000;

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
      } on FirebaseAuthException catch (e) {
        ref.read(isLoading.notifier).state = false;
        ref.read(authRes.notifier).state = e.message.toString();
        ref.read(authToken.notifier).state = 404;
      }
    });
  }

  void logIn(String email, String password, WidgetRef ref) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    ref.read(isLoading.notifier).state = true;
    Future.delayed(const Duration(seconds: 1), () async {
      try {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        ref.read(isLoading.notifier).state = false;
        ref.read(authRes.notifier).state = e.message.toString();
        ref.read(authToken.notifier).state = 404;
      }
      ref.read(isLoading.notifier).state = false;
    });
  }
}
