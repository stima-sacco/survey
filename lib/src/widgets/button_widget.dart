// ignore_for_file: prefer_const_constructors

import 'package:survey/src/pages/login_page.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

// ignore: must_be_immutable
class ButtonContainer extends StatelessWidget {
  final String label;
  final bool checked;
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerMobileNo;
  final TextEditingController controllerPassword;

  // ignore: use_key_in_widget_constructors
  ButtonContainer({
    required this.label,
    required this.checked,
    required this.controllerFirstName,
    required this.controllerLastName,
    required this.controllerEmail,
    required this.controllerMobileNo,
    required this.controllerPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade700],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Center(
          child: GestureDetector(
        onTap: () {
          switch (label) {
            case "LOGIN":
              login(context, controllerEmail, controllerPassword);
              break;
            case "SIGNUP":
              signUp(context, checked, controllerFirstName, controllerLastName,
                  controllerEmail, controllerMobileNo, controllerPassword);
              break;
          }
        },
        child: Text(label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
      )),
    );
  }

  String location = 'Null, Press Button';
  // ignore: non_constant_identifier_names
  String Address = 'search';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // ignore: non_constant_identifier_names
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // ignore: avoid_print
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    //setState(() {});
  }

  void login(BuildContext context, TextEditingController controllerEmail,
      TextEditingController controllerPassword) async {
    String message = "";

    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
    changePassword(context);
    while (true) {
      if (controllerEmail.text.trim() == "") {
        message = "Email cannot be Empty";
        break;
      }

      bool validEmail = validateEmail(controllerEmail.text.trim());
      if (validEmail == false) {
        message = "Please enter a valid Email";
        break;
      }

      if (controllerPassword.text.trim() == "") {
        message = "Password cannot be Empty";
        break;
      }

      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (BuildContext context) => const MainScreen()));

      break;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  bool validateEmail(email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  void changePassword(BuildContext context) async {
    bool errorFound = false;
    try {
      var url = Uri.parse('http://localhost:8000/api/auth/forgot-password');
      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
          },
          body: json.encode({
            'first_name': 'Walter',
            'last_name': 'Otieno',
            'other_name': 'Njoroge',
            'email': 'wnjoroge@gmail.com',
            'password': '2manager@',
            'password_confirmation': '2manager@',
            'user_type': '1',
            'user_type_desc': 'Staff',
            'id_number': '22771156',
            'staff_number': '00825514',
            'date_of_birth': '1990-01-25'
          }));
      // ignore: avoid_print
      print("response.body : " + response.body);
    } catch (e) {
      // ignore: avoid_print
      print("e.toString : " + e.toString());
      errorFound = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }

    if (errorFound == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Signup Succeeded!"),
      ));
    }
  }

  void signUp(
      BuildContext context,
      bool checked,
      TextEditingController controllerFirstName,
      TextEditingController controllerLastName,
      TextEditingController controllerEmail,
      TextEditingController controllerMobileNo,
      TextEditingController controllerPassword) {
    String message = "";

    while (true) {
      if (controllerEmail.text.trim() == "") {
        message = "Email cannot be Empty";
        break;
      }

      bool validEmail = validateEmail(controllerEmail.text.trim());
      if (validEmail == false) {
        message = "Please enter a valid Email";
        break;
      }

      if (controllerFirstName.text.trim() == "") {
        message = "First Name cannot be Empty";
        break;
      }
      if (controllerLastName.text.trim() == "") {
        message = "Last Name cannot be Empty";
        break;
      }
      if (controllerMobileNo.text.trim() == "") {
        message = "Mobile No. cannot be Empty";
        break;
      }
      if (controllerPassword.text.trim() == "") {
        message = "Password cannot be Empty";
        break;
      }
      if (checked == false) {
        message = "Accept Terms and Conditions";
        break;
      }

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage()));

      break;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
