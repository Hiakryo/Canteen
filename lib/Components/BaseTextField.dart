import 'package:flutter/material.dart';
import 'TextFieldContainer.dart';

class BaseTextField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isPass;
  const BaseTextField({
    Key key, this.hinttext, this.icon, this.onChanged, this.isPass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: isPass,
        decoration: InputDecoration(
            icon: Icon(
                icon,
                color: Colors.amber
            ),

            hintText: hinttext,
            border: InputBorder.none
        ) ,
      ),
    );
  }
}