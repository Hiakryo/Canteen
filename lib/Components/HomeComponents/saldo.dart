import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Widgets/color.dart';

class Saldo extends StatelessWidget {
  const Saldo({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.width * 0.3,
      width: screenSize.width,
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cash',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      'Rp: 99.999',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.width * 0.05,
                        ),
                        Icon(
                          Icons.arrow_upward_rounded,
                          size: 32.0,
                          color: Colors.white,
                        ),
                        Text('Pay',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: screenSize.width * 0.05,
                        ),
                        Icon(
                          Icons.add_circle,
                          size: 32.0,
                          color: Colors.white,
                        ),
                        Text('Top Up',
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
        color: ThemeColor.buttonColor,

        // boxShadow: [
        //   BoxShadow(color: Colors.green, spreadRadius: 3),
        // ],
      ),
    );
  }
}
