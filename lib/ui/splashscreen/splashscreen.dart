import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/ui/login_signup/auth.dart';
import 'package:firebase_tutorial/ui/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    final User = auth.currentUser;
    if (User != null) {
      Future.delayed(
          const Duration(seconds: 5),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const postScreen())));
    } else {
      Future.delayed(
          const Duration(seconds: 5),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Authpage())));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset("assets/animations/loading.json"),
      ),
    );
  }
}
