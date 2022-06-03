import "package:flutter/material.dart";

class EmailTextField extends StatelessWidget {
  final TextEditingController controllerEmail;
  // ignore: use_key_in_widget_constructors
  const EmailTextField({required this.controllerEmail});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerEmail,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: const TextStyle(color: Colors.black, fontSize: 16.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}
