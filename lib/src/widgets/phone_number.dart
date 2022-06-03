import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class PhoneNumberTextField extends StatelessWidget {
  final TextEditingController controllerMobileNo;
  // ignore: use_key_in_widget_constructors
  const PhoneNumberTextField({required this.controllerMobileNo});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerMobileNo,
      style: const TextStyle(fontSize: 20.0),
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(13),
        //WhitelistingTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "+254 000 000 000",
        hintStyle: const TextStyle(color: Colors.black, fontSize: 16.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        prefixIcon: const Icon(Icons.phone_android),
      ),
    );
  }
}
