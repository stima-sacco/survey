import "package:flutter/material.dart";

class NameTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  // ignore: use_key_in_widget_constructors
  const NameTextField({required this.name, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: name,
        hintStyle: const TextStyle(color: Colors.black, fontSize: 16.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        prefixIcon: const Icon(Icons.person),
      ),
    );
  }
}
