import 'dart:async';
import 'package:decarbonus/providers/provider.dart';
import 'package:decarbonus/screens/onboarding/on_boarding.dart';
import 'package:decarbonus/screens/question_welcome.dart';
import 'package:decarbonus/widgets/no_connection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  StreamSubscription? subscription;
  @override
  void initState() {
    super.initState();
    SimpleConnectionChecker simpleConnectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('www.google.com'); //Optional method to pass the lookup string
    subscription =
        simpleConnectionChecker.onConnectionChange.listen((connected) {
      ref.read(connectionProvider.notifier).state = connected;
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
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
            ),
            scaffoldBackgroundColor: const Color(0xFFFEFBEA),
            primarySwatch: Colors.teal,
            useMaterial3: true,
            fontFamily: 'Andika',
          ),
          home: ref.watch(connectionProvider) == false
              ? const NoInternet()
              : FirebaseAuth.instance.currentUser != null
                  ? const QuestionWelcomeScreen()
                  : const OnboardingScreen(),
        );
      },
    );
  }
}
