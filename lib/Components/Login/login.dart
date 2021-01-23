import 'package:flutter/material.dart';
import 'package:flutter_app/Components/BottomNav.dart';
import 'package:flutter_app/Components/Register/register.dart';
import 'package:flutter_app/main.dart';
import 'file:///C:/Users/sheed/Desktop/flutter_app/lib/Components/TextFieldContainer.dart';

import '../BaseTextField.dart';
import '../Button.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: screenSize.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.asset('Assets/logo.png',
              height: screenSize.height *0.3,
            ),
            BaseTextField(
              hinttext: "Username",
              icon: Icons.person,
              isPass: false,
              onChanged: (value){},
            ),
            BaseTextField(
              hinttext: "Password",
              icon: Icons.lock,
              isPass: true,
              onChanged: (value){},
            ),

            Button(
              text: "LOGIN",
              textColor: Colors.white,
                press: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>BottomNav()),);
                },
            ),
            Button(
              text: "REGISTER",
              textColor: Colors.white,
              press: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterScreen()),);
              },
            ),
          ],
         )
        )
      );
  }
}





