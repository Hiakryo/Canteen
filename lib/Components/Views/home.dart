import 'package:flutter/material.dart';
import 'package:flutter_app/Components/HomeComponents/news.dart';
import 'package:flutter_app/Components/HomeComponents/promo.dart';
import 'package:flutter_app/Components/Views/profile.dart';
import 'package:flutter_app/Components/bottom_navigation_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:flutter_app/Components/HomeComponents/saldo.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "App",
//       home: MainScreen(),
//     );
//   }
// }

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin<MainScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                Saldo(screenSize: screenSize),
                SizedBox(
                  height: screenSize.height * 0.04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('News',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24)),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                News(screenSize: screenSize),
                SizedBox(
                  height: screenSize.height * 0.04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Promo',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24)),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Promo(screenSize: screenSize),
              ],
            ),
          )),
    );
    throw UnimplementedError();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// MainScreen
// body: tabview -> isinya bergantung sm var global
// navbar: navbar lama -> 1 var global buat nentuin tab yg diselect
//
//
