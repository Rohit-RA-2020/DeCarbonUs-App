import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decarbonus/screens/question_welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/fade_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: FadeAnimation(
        delay: 0,
        fadeDirection: FadeDirection.right,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Dashboard'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({
                  'isResponded': false,
                  'responses': {},
                  'results': {},
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionWelcomeScreen(),
                  ),
                );
              },
              child: const Text('Clear Responses'),
            )
          ],
        ),
      ),
    );
  }
}
