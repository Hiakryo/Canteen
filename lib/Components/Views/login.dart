import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Views/home.dart';
import 'package:flutter_app/Components/bottom_navigation_bar.dart';
import 'package:flutter_app/Components/Views/register.dart';
import 'package:flutter_app/Components/text_field_container.dart';
import 'package:flutter_app/Components/base_text_field.dart';
import 'package:flutter_app/Components/button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormValidationState();
  }
}

class FormValidationState extends State<LoginScreen> {
  String _username;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(title: Text("FormDemo")),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: screenSize.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'Assets/logo.png',
                  height: screenSize.height * 0.3,
                ),
                // SizedBox(height: screenSize.height * 0.2),
                BaseTextField(
                  hinttext: "Username",
                  icon: Icons.person,
                  isPass: false,
                  onChanged: (value) {},
                ),
                BaseTextField(
                  hinttext: "Password",
                  icon: Icons.lock,
                  isPass: true,
                  onChanged: (value) {},
                ),
                Button(
                  text: "LOGIN",
                  textColor: Colors.white,
                  press: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavbar()),
                    );
                  },
                ),
                Button(
                  text: "REGISTER",
                  textColor: Colors.white,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
