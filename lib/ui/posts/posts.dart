import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/ui/login_signup/login.dart';
import 'package:firebase_tutorial/utils/utils.dart';
import 'package:flutter/material.dart';

class postScreen extends StatefulWidget {
  const postScreen({super.key});

  @override
  State<postScreen> createState() => _postScreenState();
}

class _postScreenState extends State<postScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Scree"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginpage()));
              }).onError((error, stackTrace) {
                utils().ToastMesaage(error.toString());
              });
            },
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
