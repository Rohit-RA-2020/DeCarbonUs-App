import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decarbonus/screens/question_welcome.dart';
import 'package:decarbonus/utils/get_blogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/fade_animation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
     getBlogs(ref, context);
    return Scaffold(
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
