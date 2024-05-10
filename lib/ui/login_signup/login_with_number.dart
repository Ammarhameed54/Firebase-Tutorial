import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/ui/buttons/buttons.dart';
import 'package:firebase_tutorial/ui/login_signup/verification.dart';
import 'package:firebase_tutorial/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginWIthNumber extends StatefulWidget {
  const LoginWIthNumber({super.key});

  @override
  State<LoginWIthNumber> createState() => _LoginWIthNumberState();
}

class _LoginWIthNumberState extends State<LoginWIthNumber> {
  bool loading = false;
  final NumberCOntroller = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login With Phone Number"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: NumberCOntroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: " +1 234 567 890"),
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
                label: "Login",
                loading: loading,
                press: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                      phoneNumber: NumberCOntroller.text,
                      verificationCompleted: (_) {
                        setState(() {
                          loading = false;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });
                        utils().ToastMesaage(e.toString());
                      },
                      codeSent: (String VerificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    Verify(VerificationId: VerificationId)));
                        setState(() {
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        utils().ToastMesaage(e.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                })
          ],
        ),
      ),
    );
  }
}
