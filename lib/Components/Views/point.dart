import 'package:flutter/material.dart';

class PointScreen extends StatefulWidget {
  @override
  _PointScreenState createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
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
                height: screenSize.height * 0.001,
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Hello, Kevin Alim', style: TextStyle(fontSize: 22)),
                    Image.asset('Assets/notification.png',
                        width: 32, height: 32, fit: BoxFit.fill)
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text('News',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text('Promo',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
