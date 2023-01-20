import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decarbonus/models/fade_animation.dart';
import 'package:decarbonus/screens/question_welcome.dart';
import 'package:decarbonus/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FadeAnimation(
          delay: 1.5,
          fadeDirection: FadeDirection.right,
          child: Text('Dashboard'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FadeAnimation(
        delay: 1.5,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
          );
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
