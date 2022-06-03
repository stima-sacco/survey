import "package:flutter/material.dart";

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controllerPassword;
  // ignore: use_key_in_widget_constructors
  const PasswordTextField({required this.controllerPassword});

  @override
  Widget build(BuildContext context) {
    bool _toggleVisibility = true;
    return TextField(
      controller: controllerPassword,
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: const TextStyle(color: Colors.black, fontSize: 16.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () {
              //setState(() {
              _toggleVisibility = !_toggleVisibility;
              //});
            },
            icon: _toggleVisibility
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          )),
    );
  }
}
