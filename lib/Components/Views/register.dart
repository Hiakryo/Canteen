import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Widgets/color.dart';
import 'package:flutter_app/Components/base_text_field.dart';
import 'package:flutter_app/Components/button.dart';
import 'package:flutter_app/Components/Views/login.dart';

class RegisterScreen extends StatelessWidget {
  String _username;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(  //appBar: AppBar(title: Text("FormDemo")),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 25,),
                      Text('Register',
                      style: TextStyle(color: ThemeColor.buttonColor, fontSize: 32),),
                      SizedBox(height: 10,),
                      BaseTextField(
                        hinttext: "Username",
                        icon: Icons.person,
                        isPass: false,
                        onChanged: (value) {},
                      ),
                      BaseTextField(
                        hinttext: "Telephone",
                        icon: Icons.phone,
                        isPass: true,
                        onChanged: (value) {},
                      ),
                      BaseTextField(
                        hinttext: "Email",
                        icon: Icons.email,
                        isPass: true,
                        onChanged: (value) {},
                      ),
                      BaseTextField(
                        hinttext: "NIK/NIP",
                        icon: Icons.credit_card,
                        isPass: true,
                        onChanged: (value) {},
                      ),
                      BaseTextField(
                        hinttext: "School Name",
                        icon: Icons.school,
                        isPass: true,
                        onChanged: (value) {},
                      ),
                      BaseTextField(
                        hinttext: "Password",
                        icon: Icons.lock,
                        isPass: true,
                        onChanged: (value) {},
                      ),
                      BaseTextField(
                        hinttext: "Confirm Password",
                        icon: Icons.lock,
                        isPass: true,
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 10,),
                      Button(
                        text: "REGISTER",
                        textColor: Colors.white,
                        press: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                      SizedBox(height: 25,),
                    ],
                  )))),
    ));
  }
}
