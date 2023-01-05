// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';

class Auth {
  void signUp(String email, String password, String name, WidgetRef ref) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    ref.read(isLoading.notifier).state = true;
    ref.refresh(authRes);
    ref.refresh(authToken);

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
    ref.refresh(authRes);
    ref.refresh(authToken);
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

  void googleLogin(WidgetRef ref) async {
    final googleSignIn = GoogleSignIn();
    ref.read(isLoading.notifier).state = true;
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(user.user!.email);
      print(user.user!.displayName);
      print(user.user!.uid);
    } on FirebaseException catch (e) {
      print(e);
    }
    ref.read(isLoading.notifier).state = false;
  }
}
