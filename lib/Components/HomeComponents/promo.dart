import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  const Promo({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GestureDetector(
        onTap: () {
         // print('asd');
        },
        child: Image.asset(
          'Assets/promo.png',
          height: screenSize.width * 0.5,
          width: screenSize.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
