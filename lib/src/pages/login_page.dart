//import 'package:survey/src/pages/signup_page.dart';
import 'package:survey/src/widgets/button_widget.dart';
import 'package:survey/src/widgets/email.dart';
//import 'package:survey/src/widgets/password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerMobileNo = TextEditingController();
  bool _toggleVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              top: 60.0, right: 20.0, left: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.webp'),
              const SizedBox(height: 2.0),
              Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 40.0),
              EmailTextField(controllerEmail: controllerEmail),
              const SizedBox(height: 20.0),
              //PasswordTextField(controllerPassword: controllerPassword),

              TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _toggleVisibility = !_toggleVisibility;
                        });
                      },
                      icon: _toggleVisibility
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    )),
                obscureText: _toggleVisibility,
              ),

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              ButtonContainer(
                label: "LOGIN",
                controllerEmail: controllerEmail,
                controllerPassword: controllerPassword,
                checked: false,
                controllerFirstName: controllerFirstName,
                controllerLastName: controllerLastName,
                controllerMobileNo: controllerMobileNo,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have an Account?",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         const SignupPage()));
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
