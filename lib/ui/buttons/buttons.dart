import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.label,
      required this.press,
      this.loading = false});
  final bool loading;
  final String label;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: press,
        child: loading
            ? const CircularProgressIndicator(
                strokeWidth: 4,
                color: Colors.white,
              )
            : Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
