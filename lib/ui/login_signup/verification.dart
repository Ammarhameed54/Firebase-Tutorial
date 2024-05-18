import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  final String VerificationId;
  const Verify({super.key, required this.VerificationId});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Verify"),
      ),
    );
  }
}
