import 'dart:async';
import 'package:decarbonus/screens/onboarding/on_boarding.dart';
import 'package:decarbonus/screens/question_welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? subscription;
  bool? _connected;

  @override
  void initState() {
    super.initState();
    SimpleConnectionChecker simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev'); //Optional method to pass the lookup string
    subscription =
        simpleConnectionChecker.onConnectionChange.listen((connected) {
      setState(() {
        _connected = connected;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFEFBEA),
            primarySwatch: Colors.teal,
            useMaterial3: true,
            fontFamily: 'Andika',
          ),
          home: _connected == false
              ? Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/anim/nointernet.json',
                          width: 300.w,
                          height: 300.h,
                        ),
                        const Center(
                          child: Text(
                            'Check your internet connection!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : FirebaseAuth.instance.currentUser != null
                  ? const QuestionWelcomeScreen()
                  : const OnboardingScreen(),
        );
      },
    );
  }
}
