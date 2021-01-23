
import 'package:flutter/material.dart';
import '../BaseTextField.dart';
import '../Button.dart';
import '../Login/login.dart';

class RegisterScreen extends StatelessWidget{
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [


                Image.asset('Assets/logo.png',
                  height: screenSize.height *0.3,
                ),
                SizedBox(height: screenSize.height*0.1),
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
                  text: "REGISTER!",
                  textColor: Colors.white,
                  press: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  },
                ),
              ],
            )
        )
    );
  }
}