// ignore_for_file: avoid_print, unused_result
import 'package:decarbonus/screens/question_welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';

class Auth {
  void signUp(String email, String password, String name, WidgetRef ref,
      BuildContext context) {
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
          {
            'email': cred.user!.email,
            'name': name,
            'uid': cred.user!.uid,
            'photo':
                'https://firebasestorage.googleapis.com/v0/b/decarbonus-c1037.appspot.com/o/profile.png?alt=media&token=b7fb1269-59bd-4e66-b3f5-a5cd268d9840',
            'responses': {},
          },
        );
        ref.read(isLoading.notifier).state = false;
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const QuestionWelcomeScreen(),
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        ref.read(isLoading.notifier).state = false;
        ref.read(authRes.notifier).state = e.message.toString();
        ref.read(authToken.notifier).state = 404;
      }
    });
  }

  void logIn(String email, String password, WidgetRef ref,
      BuildContext context) async {
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
        ref.read(isLoading.notifier).state = false;
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const QuestionWelcomeScreen(),
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        ref.read(isLoading.notifier).state = false;
        ref.read(authRes.notifier).state = e.message.toString();
        ref.read(authToken.notifier).state = 404;
      }
      ref.read(isLoading.notifier).state = false;
    });
  }

  void googleLogin(WidgetRef ref, BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
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
      await firestore.collection('users').doc(user.user!.uid).set(
        {
          'email': user.user!.email,
          'name': user.user!.displayName,
          'uid': user.user!.uid,
          'photo': user.user!.photoURL,
          'responses': {},
        },
      );
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const QuestionWelcomeScreen(),
          ),
        );
      });
    } on FirebaseException catch (e) {
      ref.read(isLoading.notifier).state = false;
      ref.read(authRes.notifier).state = e.message.toString();
      ref.read(authToken.notifier).state = 404;
    }
    ref.read(isLoading.notifier).state = false;
  }
}
