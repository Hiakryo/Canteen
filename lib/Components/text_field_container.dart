import 'package:flutter/material.dart';

import 'Widgets/color.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: screenSize.width * 0.8,
      decoration: BoxDecoration(
        color: ThemeColor.textFieldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}

