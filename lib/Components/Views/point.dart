import 'package:flutter/material.dart';
import 'package:flutter_app/Components/HomeComponents/promo.dart';

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
                      Text('Point', style: TextStyle(fontSize: 22)),
                      IconButton(
                        icon: Icon(
                          Icons.card_giftcard_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // do something
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: screenSize.width * 0.3,
                  width: screenSize.width,
                  padding: EdgeInsets.all(10.0),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          height: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  '100 Coin',
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                )
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenSize.width * 0.05,
                                    ),

                                    Text('Purchased More ',
                                        style:
                                        TextStyle(color: Colors.white, fontSize: 20)),
                                    Text('To Get More Coin',
                                        style:
                                        TextStyle(color: Colors.white, fontSize: 20)),
                                  ],
                                ),

                              ],
                            )),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,

                    // boxShadow: [
                    //   BoxShadow(color: Colors.green, spreadRadius: 3),
                    // ],
                  ),
                ),

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
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Promo(screenSize: screenSize),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Promo(screenSize: screenSize),

              ],
            ),
          )),
    );
  }
}