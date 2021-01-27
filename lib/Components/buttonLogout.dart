import 'package:flutter/material.dart';
class ButtonLog extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const ButtonLog({
    Key key, this.text, this.press, this.color, this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: screenSize.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
          color: Colors.red,
          onPressed: press,
          
          child: Text(
            text,
            style: TextStyle(color: Colors.white),

          ),
        ),
      ),
    );
  }
}
