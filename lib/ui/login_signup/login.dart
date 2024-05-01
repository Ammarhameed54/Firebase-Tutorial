import 'package:firebase_tutorial/ui/buttons/buttons.dart';
import 'package:firebase_tutorial/ui/login_signup/signup.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller;
    passcontroller;
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/loginpic.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const Text(
                  "Login To Continue",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                  validator: (value) {
                    bool emialValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_^{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter Email";
                    }
                    if (!emialValid) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_open)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    }
                    if (value.length < 8) {
                      return "The Password Must be 8 Characters Long";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                    label: "Login",
                    press: () {
                      if (_formkey.currentState!.validate()) {}
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account? "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup()));
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
