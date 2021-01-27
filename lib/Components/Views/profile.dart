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
                  height: screenSize.height * 0.05,
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
                        Text('Telephone Number :',
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
                SizedBox(
                  height: screenSize.height * 0.4,
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
