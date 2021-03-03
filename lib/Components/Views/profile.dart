import 'package:flutter/material.dart';

import '../button.dart';
import '../buttonLogout.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
     Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: screenSize.width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Username :',
                            style: TextStyle(fontSize: 20)),
                        Text('Kevin Alim',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                  height: screenSize.height * 0.05,
                  ),
                Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Phone Number :',
                            style: TextStyle(fontSize: 20)),
                        Text('+6287880801095',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Email :',
                            style: TextStyle(fontSize: 20)),
                        Text('kevinalim@rocketmail.com',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Account',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  color: Colors.white,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[

                      Text('History', textAlign: TextAlign.start ,style: TextStyle(fontSize: 20)),
                      Image.asset('Assets/arrow.png',
                          width: 18, height: 18, fit: BoxFit.fill)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  color: Colors.white,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[

                      Text('Enter Promo Code', textAlign: TextAlign.start ,style: TextStyle(fontSize: 20)),
                      Image.asset('Assets/arrow.png',
                          width: 18, height: 18, fit: BoxFit.fill)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  color: Colors.white,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[

                      Text('Invite Friends', textAlign: TextAlign.start ,style: TextStyle(fontSize: 20)),
                      Image.asset('Assets/arrow.png',
                          width: 18, height: 18, fit: BoxFit.fill)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  color: Colors.white,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[

                      Text('Change Language', textAlign: TextAlign.start ,style: TextStyle(fontSize: 20)),
                      Image.asset('Assets/arrow.png',
                          width: 18, height: 18, fit: BoxFit.fill)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  color: Colors.white,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[

                      Text('Terms of Service', textAlign: TextAlign.start ,style: TextStyle(fontSize: 20)),
                      Image.asset('Assets/arrow.png',
                          width: 18, height: 18, fit: BoxFit.fill)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  color: Colors.white,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[

                      Text('Privacy Policy', textAlign: TextAlign.start ,style: TextStyle(fontSize: 20)),
                      Image.asset('Assets/arrow.png',
                          width: 18, height: 18, fit: BoxFit.fill)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                ButtonLog(
                  text: "Log Out",
                  textColor: Colors.white,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ]
            ),
          ),
        )
    );
  }
}