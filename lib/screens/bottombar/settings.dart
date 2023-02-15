import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decarbonus/screens/auth/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/links.dart';
import '../question_welcome.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late FirebaseAuth auth;
  late bool isEmailVerified;

  bool isSwitched = false;

  @override
  void initState() {
    auth = FirebaseAuth.instance;
    isEmailVerified = auth.currentUser!.emailVerified;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  auth.currentUser!.photoURL ?? profileImg,
                ),
              ),
              title: Text(auth.currentUser!.email!),
            ),
            ListTile(
              leading: Icon(
                Icons.verified,
                color: isEmailVerified ? Colors.green : null,
              ),
              title: isEmailVerified
                  ? const Text('Email verified')
                  : const Text('Send verification email'),
              onTap: isEmailVerified
                  ? null
                  : () async {
                      await auth.currentUser!.sendEmailVerification().then(
                            (value) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Verification email sent successfully'),
                              ),
                            ),
                          );
                    },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_outline,
                color: isEmailVerified ? Colors.green : null,
              ),
              title: const Text("Clear response"),
              onTap: () {
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
            ),
            const SizedBox(height: 20),
            const Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(),
            SwitchListTile(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              title: const Text('Receive notifications'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Privacy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy Policy'),
              onTap: () {
                // navigate to privacy policy page
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await auth.signOut().then(
                      (value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage(),
                        ),
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
